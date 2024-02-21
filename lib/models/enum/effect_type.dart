import 'package:json_annotation/json_annotation.dart';

// todo add new

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