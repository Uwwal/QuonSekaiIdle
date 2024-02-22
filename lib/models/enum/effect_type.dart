/// effect类型

import 'package:json_annotation/json_annotation.dart';

// todo add new

/// 标记effect主要功能, 分别为修改输出, 修改输入, 修改属性, 修改行动间隔, 修改effectList
@JsonEnum(valueField: 'type')
enum EffectType{
  modifyOutgoingDamageNum(0),
  modifyIncomingDamageNum(1),
  modifyStatus(2),
  modifyActionInterval(3),
  modifyEffectList(4);

  final int type;

  const EffectType(this.type);
}