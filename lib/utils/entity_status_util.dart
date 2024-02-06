import 'package:quon_sekai_idle/models/abstract/entity.dart';

List<double> getStatusListFromEntity(Entity entity) => [
      entity.str,
      entity.con,
      entity.dex,
      entity.per,
      entity.ler,
      entity.wil,
      entity.mag,
      entity.chr
    ];

void setStatusFromList(Entity entity, List<double> status){
  entity.str = status[0];
  entity.con = status[1];
  entity.dex = status[2];
  entity.per = status[3];
  entity.ler = status[4];
  entity.wil = status[5];
  entity.mag = status[6];
  entity.chr = status[7];
}

// 力量 ~ 血量, 物理伤害附加值, 近战伤害乘数
// 体质 ~ 防御, 血量, 物理伤害附加值, 近战伤害乘数
// 灵巧 ~ 闪避, 远程伤害乘数, 暴击概率, 格斗
// 感知 ~ 闪避, 命中, 远程伤害乘数, 暴击概率
// 学识 ~ 法抗, 成长率, 法术伤害附加值, 法术成功率
// 意志 ~ 血量, 精神抗性, 近战伤害附加值, 格斗
// 魔力 ~ 法抗, 法术伤害倍率
// 魅力 ~ 精神抗性, 精神伤害倍率