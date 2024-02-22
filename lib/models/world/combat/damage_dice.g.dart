// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'damage_dice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DamageDice _$DamageDiceFromJson(Map<String, dynamic> json) => DamageDice(
      $enumDecode(_$DamageTypeEnumMap, json['type']),
      json['times'] as int,
      json['min'] as int,
      max: json['max'] as int?,
    );

Map<String, dynamic> _$DamageDiceToJson(DamageDice instance) =>
    <String, dynamic>{
      'type': _$DamageTypeEnumMap[instance.type]!,
      'times': instance.times,
      'min': instance.min,
      'max': instance.max,
    };

const _$DamageTypeEnumMap = {
  DamageType.physical: 'physical',
  DamageType.flame: 'flame',
};
