import 'package:json_annotation/json_annotation.dart';

import 'effect.dart';
import '../../enum/effect_type.dart';

part 'effect_list.g.dart';

@JsonSerializable()
class EffectList {
  List<Effect> list = [];

  int modifyOutgoingDamageNum = 0;
  int modifyIncomingDamageNum = 0;
  int modifyStatus = 0;
  int modifyActionInterval = 0;

  EffectList({List<Effect>? list}) {
    this.list = list ?? [];
    for (var effect in this.list) {
      switch (effect.type) {
        case EffectType.modifyOutgoingDamageNum:
          modifyOutgoingDamageNum++;
          break;
        case EffectType.modifyIncomingDamageNum:
          modifyIncomingDamageNum++;
          break;
        case EffectType.modifyStatus:
          modifyStatus++;
          break;
        case EffectType.modifyActionInterval:
          modifyActionInterval++;
          break;
        default:
          throw Error();
      }
    }
  }

  factory EffectList.fromJson(Map<String, dynamic> json) => _$EffectListFromJson(json);
  Map<String, dynamic> toJson() => _$EffectListToJson(this);

  void addAll(EffectList other) {
    list.addAll(other.list);
    modifyOutgoingDamageNum += other.modifyOutgoingDamageNum;
    modifyIncomingDamageNum += other.modifyIncomingDamageNum;
    modifyStatus += other.modifyStatus;
    modifyActionInterval += other.modifyActionInterval;
  }

  bool checkEffectTypeAboveZero(EffectType effectType) {
    switch (effectType) {
      case EffectType.modifyOutgoingDamageNum:
        return modifyOutgoingDamageNum > 0;
      case EffectType.modifyIncomingDamageNum:
        return modifyActionInterval > 0;
      case EffectType.modifyStatus:
        return modifyStatus > 0;
      case EffectType.modifyActionInterval:
        return modifyActionInterval > 0;
      default:
        throw Error();
    }
  }

  List<Effect> getEffectTypeList(EffectType effectType) => list
      .where((effect) =>
          effect.type == effectType && checkEffectTypeAboveZero(effectType))
      .toList();
}