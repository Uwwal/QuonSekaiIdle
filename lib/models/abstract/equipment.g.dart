// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Equipment _$EquipmentFromJson(Map<String, dynamic> json) => Equipment(
      json['name'] as String,
      $enumDecode(_$BodyPartEnumMap, json['bodyPart']),
      (json['damageDiceList'] as List<dynamic>)
          .map((e) => DamageDice.fromJson(e as Map<String, dynamic>))
          .toList(),
      effectList: json['effectList'] == null
          ? null
          : EffectList.fromJson(json['effectList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EquipmentToJson(Equipment instance) => <String, dynamic>{
      'name': instance.name,
      'bodyPart': _$BodyPartEnumMap[instance.bodyPart]!,
      'damageDiceList': instance.damageDiceList,
      'effectList': instance.effectList,
    };

const _$BodyPartEnumMap = {
  BodyPart.head: 'head',
  BodyPart.body: 'body',
  BodyPart.hand: 'hand',
};
