// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slot_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlotTupleList _$SlotTupleListFromJson(Map<String, dynamic> json) =>
    SlotTupleList(
      (json['list'] as List<dynamic>)
          .map((e) => Tuple<Slot, int>.fromJson(
              e as Map<String, dynamic>,
              (value) => Slot.fromJson(value as Map<String, dynamic>),
              (value) => value as int))
          .toList(),
    );

Map<String, dynamic> _$SlotTupleListToJson(SlotTupleList instance) =>
    <String, dynamic>{
      'list': instance.list
          .map((e) => e.toJson(
                (value) => value,
                (value) => value,
              ))
          .toList(),
    };
