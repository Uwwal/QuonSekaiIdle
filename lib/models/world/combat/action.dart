/// 战斗行动相关

import 'package:json_annotation/json_annotation.dart';
import 'package:quon_sekai_idle/models/world/combat/slot_repository.dart';

part 'action.g.dart';

@JsonSerializable()
class CombatAction {
  /// 本行动是否以自己为目标
  bool selfTarget;

  /// todo 等待被id替换
  String type;

  /// todo 等待规范化！
  /// numList: 持续时间, 伤害基础乘数, 伤害基数, ...
  List<num> numList;

  int coolDown;

  /// 先减后增
  SlotTupleList consumeSlot;
  SlotTupleList createSlot;

  CombatAction(this.selfTarget, this.type, this.numList, this.coolDown,
      this.consumeSlot, this.createSlot);

  factory CombatAction.fromJson(Map<String, dynamic> json) => _$CombatActionFromJson(json);
  Map<String, dynamic> toJson() => _$CombatActionToJson(this);
}
