// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'effect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Effect _$EffectFromJson(Map<String, dynamic> json) => Effect(
      json['id'] as int,
      $enumDecode(_$EffectTypeEnumMap, json['type']),
      (json['numList'] as List<dynamic>).map((e) => e as num).toList(),
      functionId: json['functionId'] as int? ?? 0,
    );

Map<String, dynamic> _$EffectToJson(Effect instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$EffectTypeEnumMap[instance.type]!,
      'numList': instance.numList,
      'functionId': instance.functionId,
    };

const _$EffectTypeEnumMap = {
  EffectType.modifyOutgoingDamageNum: 'modifyOutgoingDamageNum',
  EffectType.modifyIncomingDamageNum: 'modifyIncomingDamageNum',
  EffectType.modifyStatus: 'modifyStatus',
  EffectType.modifyActionInterval: 'modifyActionInterval',
};
