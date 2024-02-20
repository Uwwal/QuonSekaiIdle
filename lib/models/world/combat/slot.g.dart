// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Slot _$SlotFromJson(Map<String, dynamic> json) => Slot(
      type: $enumDecodeNullable(_$SlotTypeEnumMap, json['type']) ??
          SlotType.empty,
      index: json['index'] as int? ?? -1,
      test: json['test'] as String? ?? '1',
    )
      ..next = json['next'] == null
          ? null
          : Slot.fromJson(json['next'] as Map<String, dynamic>)
      ..prev = json['prev'] == null
          ? null
          : Slot.fromJson(json['prev'] as Map<String, dynamic>);

Map<String, dynamic> _$SlotToJson(Slot instance) => <String, dynamic>{
      'index': instance.index,
      'type': _$SlotTypeEnumMap[instance.type]!,
      'test': instance.test,
      'next': instance.next,
      'prev': instance.prev,
    };

const _$SlotTypeEnumMap = {
  SlotType.empty: 'empty',
  SlotType.shapeChange: 'shapeChange',
  SlotType.flame: 'flame',
};
