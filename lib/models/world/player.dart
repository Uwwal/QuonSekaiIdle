import 'dart:async';

import 'package:quon_sekai_idle/models/world/combat/status.dart';
import 'package:quon_sekai_idle/models/world/world.dart';

import '../../constants/player_constants.dart';
import '../abstract/entity.dart';
import 'combat/action.dart';

class Player extends Entity {
  /* static instance start */
  static final Player _player = Player._internal(
      defaultMaxHp,
      defaultSlotList,
      defaultLevel,
      defaultActionInterval,
      defaultCombatActionList,
      defaultStatus);

  // Player(super.maxHp, super.slotRepository, super.level, super.actionInterval, super.combatActionList, super.status);

  Player._internal(
      int maxHp,
      int maxSlotLen,
      int level,
      int actionInterval,
      List<CombatAction> combatActionList,
      List<double> status)
      : super(-1, maxHp, maxSlotLen, level, actionInterval, combatActionList,
            CombatStatus(status));

  static Player getPlayerInstance() {
    return _player;
  }
  /* static instance over */
  /* override start */
  // 用于中断寻敌计时器
  bool executeFindEnemy = false;

  @override
  void finishCombat() {
    super.finishCombat();

    if(hp > 0){
      // todo 获得战利品
    }
    findEnemy();
  }

  int _getEnemyCoolDown(){
    // todo 固定数值*属性减免
    return 1000;
  }

  void findEnemy(){
    executeFindEnemy = true;
    Timer(Duration(milliseconds: _getEnemyCoolDown()), (){
      if(executeFindEnemy){
        var world = World.getWorldInstance();
        target = world.generateEnemy();
        world.startCombat();
      }
    });
  }
  /* override over */
}
