/// 实体的战斗属性

import 'package:json_annotation/json_annotation.dart';

import '../../enum/combat_status_type.dart';

part 'status.g.dart';

@JsonSerializable()
class CombatStatus {
  /* field start */
  final List<double> status;
  /* field over */
  /* constructor start */
  CombatStatus(this.status) : assert(status.length == 8);

  factory CombatStatus.fromJson(Map<String, dynamic> json) =>
      _$CombatStatusFromJson(json);
  Map<String, dynamic> toJson() => _$CombatStatusToJson(this);
  /* constructor over */
  /* method start */
  double getStatus(CombatStatusType type) {
    switch (type) {
      case CombatStatusType.str:
        return status[0];
      case CombatStatusType.con:
        return status[1];
      case CombatStatusType.dex:
        return status[2];
      case CombatStatusType.per:
        return status[3];
      case CombatStatusType.ler:
        return status[4];
      case CombatStatusType.wil:
        return status[5];
      case CombatStatusType.mag:
        return status[6];
      case CombatStatusType.chr:
        return status[7];
    }
  }
  /* method over */
}

// 力量 ~ 血量, 物理伤害附加值, 近战伤害乘数
// 体质 ~ 防御, 血量, 物理伤害附加值, 近战伤害乘数
// 灵巧 ~ 闪避, 远程伤害乘数, 暴击概率, 格斗
// 感知 ~ 闪避, 命中, 远程伤害乘数, 暴击概率
// 学识 ~ 法抗, 成长率, 法术伤害附加值, 法术成功率
// 意志 ~ 血量, 精神抗性, 近战伤害附加值, 格斗
// 魔力 ~ 法抗, 法术伤害倍率
// 魅力 ~ 精神抗性, 精神伤害倍率
