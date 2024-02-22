/// 抽象类, player和enemy继承此, 为游戏内实体.

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

  /// 行动间隔
  int actionInterval;

  /// 仅做显示
  late int spd;

  List<CombatAction> combatActionList;
  List<int> combatActionCoolDownList;

  CombatStatus status;

  // todo 整合
  // 装备提供
  EffectList equipmentEffectList = EffectList();
  // 战斗buff提供
  EffectList buffEffectList = EffectList();
  // 职业提供
  EffectList jobEffectList = EffectList();

  Map<BodyPart, Equipment> equipmentMap;

  late Entity target;

  /// 战斗进行中
  bool isExecuteCombat = false;
  late Timer timer;
  /* field over */
  /* constructor start */
  Entity(this.id, this.maxHp, this.maxSlotLen, this.level, this.actionInterval,
      this.combatActionList, this.status,
      {Map<BodyPart, Equipment>? equipmentMap})
      : hp = maxHp,
        combatActionCoolDownList =
            List<int>.generate(combatActionList.length, (_) => 0),
        equipmentMap = equipmentMap ?? {} {
    slotRepository = SlotRepository(maxSlotLen);
    spd = _calculateSpd();

    // todo equipment effect init

    ensureEmptySafeMap(this.equipmentMap);
  }
  /* constructor over */
  /* method start */
  /// 根据ActionInterval计算spd, 用来显示
  int _calculateSpd() {
    // todo
    return 1;
  }

  /// 获取行动间隔, 根据effect修改
  int _getActionInterval() {
    // todo
    return actionInterval;
  }

  // todo 新增 get status

  /// param: curActionInterval 当前行动间隔 单位ms
  /// return: 下次行动间隔 单位ms
  /// 遍历combatActionCoolDownList, 找到cd小于param的行动, 根据slot尝试执行
  /// 如果执行成功则依照手部装备产生伤害, 对输出伤害进行加工, 标记成功执行战斗动作
  /// 若执行失败则跳过
  /// 遍历的同时检查最小cd, 如果本轮没有执行战斗动作, 则返回最小cd设置定时器
  int _action(int curActionInterval) {
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

          // todo 不需要产生战斗伤害的行动
          var weapon = equipmentMap[BodyPart.hand];
          var damageList = weapon!.getDamage();

          modifyOutgoingDamage(damageList);

          target.handleIncomingDamage(damageList);

          finish = true;
          combatActionCoolDownList[i] += action.coolDown;
        }
        // 似乎不需要1ms就来看看是否满足条件, 因为slot还没被修改
        // minCoolDown = 1;
      } else {
        combatActionCoolDownList[i] -= curActionInterval;
        // update min
        minCoolDown = min(minCoolDown, combatActionCoolDownList[i]);
      }
    }
    return finish ? -1 : minCoolDown;
  }

  /// 承伤
  void handleIncomingDamage(List<Damage> damageList) {
    modifyIncomingDamage(damageList);

    int totalDamage =
        damageList.reduce((value, element) => value + element).value;

    hp -= totalDamage;

    if (hp <= 0) {
      _handleHpBelowZero();
    }
  }

  /// 修改输出伤害
  void modifyOutgoingDamage(List<Damage> damageList) {
    EffectType type = EffectType.modifyOutgoingDamageNum;

    modifyDamage(damageList, type, equipmentEffectList, this, true);
    modifyDamage(damageList, type, buffEffectList, this, true);
    modifyDamage(damageList, type, jobEffectList, this, true);
  }

  /// 修改输入伤害
  void modifyIncomingDamage(List<Damage> damageList) {
    EffectType type = EffectType.modifyIncomingDamageNum;

    modifyDamage(damageList, type, equipmentEffectList, this, false);
    modifyDamage(damageList, type, buffEffectList, this, false);
    modifyDamage(damageList, type, jobEffectList, this, false);
  }

  /// 战斗胜利条件之血量低于0
  void _handleHpBelowZero() => finishCombat();

  /// 完成战斗
  void finishCombat() {
    isExecuteCombat = false;
    timer.cancel();
  }

  /// 开始战斗
  void startCombat() async {
    // todo 战斗初始化
    hp = maxHp;
    isExecuteCombat = true;
    int curActionInterval = -1;

    while (isExecuteCombat) {
      timer = Timer(Duration(milliseconds: curActionInterval), () {
        if (curActionInterval == -1) {
          curActionInterval = _getActionInterval();
        }
        curActionInterval = _action(curActionInterval);
      });
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    switch (other.runtimeType) {
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
