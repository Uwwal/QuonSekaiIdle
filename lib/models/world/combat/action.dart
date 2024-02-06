import 'package:quon_sekai_idle/models/world/combat/slot_repository.dart';

class CombatAction {
  bool selfTarget;

  String type;

  // numList: 持续时间, 伤害基础乘数, 伤害基数, ...
  List<num> numList;

  int coolDown;

  // 先减后增
  SlotTupleList consumeSlot;
  SlotTupleList createSlot;

  CombatAction(this.selfTarget, this.type, this.numList, this.coolDown,
      this.consumeSlot, this.createSlot);
}
