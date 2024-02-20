// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CombatAction _$CombatActionFromJson(Map<String, dynamic> json) => CombatAction(
      json['selfTarget'] as bool,
      json['type'] as String,
      (json['numList'] as List<dynamic>).map((e) => e as num).toList(),
      json['coolDown'] as int,
      SlotTupleList.fromJson(json['consumeSlot'] as Map<String, dynamic>),
      SlotTupleList.fromJson(json['createSlot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CombatActionToJson(CombatAction instance) =>
    <String, dynamic>{
      'selfTarget': instance.selfTarget,
      'type': instance.type,
      'numList': instance.numList,
      'coolDown': instance.coolDown,
      'consumeSlot': instance.consumeSlot,
      'createSlot': instance.createSlot,
    };
