// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'effect_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EffectList _$EffectListFromJson(Map<String, dynamic> json) => EffectList(
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => Effect.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..durationList =
          (json['durationList'] as List<dynamic>).map((e) => e as int).toList()
      ..modifyOutgoingDamageNum = json['modifyOutgoingDamageNum'] as int
      ..modifyIncomingDamageNum = json['modifyIncomingDamageNum'] as int
      ..modifyStatus = json['modifyStatus'] as int
      ..modifyActionInterval = json['modifyActionInterval'] as int;

Map<String, dynamic> _$EffectListToJson(EffectList instance) =>
    <String, dynamic>{
      'list': instance.list,
      'durationList': instance.durationList,
      'modifyOutgoingDamageNum': instance.modifyOutgoingDamageNum,
      'modifyIncomingDamageNum': instance.modifyIncomingDamageNum,
      'modifyStatus': instance.modifyStatus,
      'modifyActionInterval': instance.modifyActionInterval,
    };
