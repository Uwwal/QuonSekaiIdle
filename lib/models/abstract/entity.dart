import 'dart:async';
import 'dart:math';

import 'package:quon_sekai_idle/models/enum/body_part.dart';
import 'package:quon_sekai_idle/models/world/combat/status.dart';
import 'package:quon_sekai_idle/utils/effect_util.dart';
import 'package:quon_sekai_idle/utils/equipment_util.dart';

import '../enum/effect_type.dart';
import '../world/combat/action.dart';
import '../world/combat/damage.dart';
import '../world/combat/effect_list.dart';
import '../world/combat/slot_repository.dart';
import '../world/equipment.dart';

abstract class Entity {
  /* field start */
  int id;

  int hp;
  int maxHp;

  int maxSlotLen;
  late SlotRepository slotRepository;

  int level;

  // 行动间隔
  int actionInterval;

  // 仅做显示
  late int spd;

  List<CombatAction> combatActionList;
  List<int> combatActionCoolDownList;

  CombatStatus status;

  // 装备提供
  EffectList equipmentEffectList = EffectList();
  // 战斗buff提供
  EffectList buffEffectList = EffectList();
  // 职业提供
  EffectList jobEffectList = EffectList();

  Map<BodyPart, Equipment> equipmentMap;

  late Entity target;

  bool executeCombat = false;
  /* field over */
  /* constructor start */
  Entity(this.id, this.maxHp, this.maxSlotLen, this.level, this.actionInterval,
      this.combatActionList, this.status,
      {Map<BodyPart, Equipment>? equipmentMap})
      : hp = maxHp,
        combatActionCoolDownList =
            List<int>.generate(combatActionList.length, (_) => 0),
        equipmentMap = equipmentMap ?? {}{
    slotRepository = SlotRepository(maxSlotLen);
    spd = _calculateSpd();

    // todo equipment effect

    ensureEmptySafeMap(this.equipmentMap);
  }
  /* constructor over */
  /* method start */
  int _calculateSpd() {
    // todo
    return 1;
  }

  int _getActionInterval() {
    // todo
    return actionInterval;
  }

  int _action(int curActionInterval) {
    // 返回: 执行成功 ? -1 : minCoolDown
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

    modifyDamage(damageList, type, equipmentEffectList, this, true);
    modifyDamage(damageList, type, buffEffectList, this, true);
    modifyDamage(damageList, type, jobEffectList, this, true);
  }

  void modifyIncomingDamage(List<Damage> damageList) {
    EffectType type = EffectType.modifyIncomingDamageNum;

    modifyDamage(damageList, type, equipmentEffectList, this, false);
    modifyDamage(damageList, type, buffEffectList, this, false);
    modifyDamage(damageList, type, jobEffectList, this, false);
  }

  void _handleHpBelowZero() => finishCombat();

  void finishCombat() {
    executeCombat = false;
  }

  Future<void> startCombat() async {
    executeCombat = true;
    int curActionInterval = -1;
    while (executeCombat) {
      await Future.delayed(Duration(milliseconds: curActionInterval));
      if (curActionInterval == -1) {
        curActionInterval = _getActionInterval();
      }
      curActionInterval = _action(curActionInterval);
    }
  }

  @override
  bool operator ==(Object other) {
    if(identical(this, other)){return true;}
    switch(other.runtimeType){
      case Entity:
        return id == (other as Entity).id;
      case int:
        return id == other;
      default:
        throw Error();
    }
  }

  @override
  int get hashCode => id.hashCode;
  /* method over */
}
