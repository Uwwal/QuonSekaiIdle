import 'dart:math';

import 'package:quon_sekai_idle/models/enum/body_part.dart';
import 'package:quon_sekai_idle/utils/effect_util.dart';
import 'package:quon_sekai_idle/utils/entity_status_util.dart';
import 'package:quon_sekai_idle/utils/equipment_util.dart';

import '../enum/effect_type.dart';
import '../world/combat/action.dart';
import '../world/combat/damage.dart';
import '../world/combat/effect_list.dart';
import '../world/combat/slot_repository.dart';
import 'equipment.dart';

abstract class Entity {
  int hp;
  int maxHp;

  int maxSlot;
  SlotRepository slotRepository;

  int level;

  late double str;
  late double con;
  late double dex;
  late double per;
  late double ler;
  late double wil;
  late double mag;
  late double chr;

  // 行动间隔
  int actionInterval;

  // 仅做显示
  late int spd;

  List<CombatAction> combatActionList;
  List<int> combatActionCoolDownList;

  // 战斗buff提供
  EffectList buffEffectList = EffectList();
  // 职业提供
  EffectList jobEffectList = EffectList();

  Map<BodyPart, Equipment> equipmentMap;

  late Entity target;

  Entity(this.maxHp, this.slotRepository, this.level, this.actionInterval,
      this.combatActionList, List<double> status,
      {Map<BodyPart, Equipment>? equipmentMap})
      : hp = maxHp,
        maxSlot = slotRepository.len,
        combatActionCoolDownList =
            List<int>.generate(combatActionList.length, (_) => 0),
        equipmentMap = equipmentMap ?? {} {
    spd = _calculateSpd();
    setStatusFromList(this, status);

    ensureEmptySafeMap(this.equipmentMap);
  }

  int _calculateSpd() {
    // todo
    return 1;
  }

  int _getActionInterval() {
    // todo
    return actionInterval;
  }

  int _action({int? lastFailActionListMinCoolDown}) {
    // 返回: 执行成功 ? -1 : minCoolDown
    var curActionInterval =
        lastFailActionListMinCoolDown ?? _getActionInterval();
    var minCoolDown = curActionInterval;

    var finish = false;

    for (var i = 0; i < combatActionCoolDownList.length; i++) {
      var cd = combatActionCoolDownList[i];
      if (cd <= curActionInterval) {
        combatActionCoolDownList[i] = 0;
        if (finish) continue;

        var action = combatActionList[i];

        if (slotRepository.hasEnoughSlots(
            action.consumeSlot, action.createSlot)) {
          slotRepository.consumeSlot(action.consumeSlot);
          slotRepository.createSlot(action.createSlot);

          var weapon = equipmentMap[BodyPart.hand];
          var damageList = weapon!.getDamage();

          modifyOutgoingDamage(damageList);

          target.handleIncomingDamage(damageList);

          finish = true;
          combatActionCoolDownList[i] += action.coolDown;
        }
        minCoolDown = 1;
      } else {
        combatActionCoolDownList[i] -= curActionInterval;
        // update min
        minCoolDown = min(minCoolDown, combatActionCoolDownList[i]);
      }
    }
    return finish ? -1 : minCoolDown;
  }

  void handleIncomingDamage(List<Damage> damageList) {
    modifyIncomingDamage(damageList);

    int totalDamage =
        damageList.reduce((value, element) => value + element).value;

    hp -= totalDamage;

    if (hp <= 0) {
      _handleHpBelowZero();
    }
  }

  void modifyOutgoingDamage(List<Damage> damageList) {
    EffectType type = EffectType.modifyOutgoingDamageNum;

    equipmentMap.forEach((bodyPart, equipment) {
      equipment.modifyOutgoingDamage(damageList);
    });

    modifyDamage(damageList, type, buffEffectList);
    modifyDamage(damageList, type, jobEffectList);
  }

  void modifyIncomingDamage(List<Damage> damageList) {
    EffectType type = EffectType.modifyIncomingDamageNum;

    equipmentMap.forEach((bodyPart, equipment) {
      equipment.modifyIncomingDamage(damageList);
    });

    modifyDamage(damageList, type, buffEffectList);
    modifyDamage(damageList, type, jobEffectList);
  }

  void _handleHpBelowZero() => finishCombat();

  void finishCombat(){}

  void startFight(Entity target){}
}
