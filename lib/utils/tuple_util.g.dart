// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tuple_util.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tuple<T1, T2> _$TupleFromJson<T1 extends Object, T2 extends Object>(
  Map<String, dynamic> json,
  T1 Function(Object? json) fromJsonT1,
  T2 Function(Object? json) fromJsonT2,
) =>
    Tuple<T1, T2>(
      fromJsonT1(json['item1']),
      fromJsonT2(json['item2']),
    );

Map<String, dynamic> _$TupleToJson<T1 extends Object, T2 extends Object>(
  Tuple<T1, T2> instance,
  Object? Function(T1 value) toJsonT1,
  Object? Function(T2 value) toJsonT2,
) =>
    <String, dynamic>{
      'item1': toJsonT1(instance.item1),
      'item2': toJsonT2(instance.item2),
    };
