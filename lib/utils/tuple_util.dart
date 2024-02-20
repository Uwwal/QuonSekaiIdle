import 'package:json_annotation/json_annotation.dart';

import '../constants/error_constants.dart';

part 'tuple_util.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Tuple<T1 extends Object, T2 extends Object> {
  final T1 item1;
  final T2 item2;

  Tuple(this.item1, this.item2);

  factory Tuple.fromJson(
    Map<String, dynamic> json,
    T1 Function(Object? json) fromJsonT1,
    T2 Function(Object? json) fromJsonT2,
  ) =>
      _$TupleFromJson(json, fromJsonT1, fromJsonT2);

  Map<String, dynamic> toJson(
    Object? Function(T1 value) toJsonT1,
    Object? Function(T2 value) toJsonT2,
  ) =>
      _$TupleToJson(this, toJsonT1, toJsonT2);

  dynamic operator [](int index) {
    if (index == 0) {
      return item1;
    }
    if (index == 1) {
      return item2;
    }
    throw IndexError.withLength(index, 2);
  }

  num operator -(Object other) {
    switch (other.runtimeType) {
      case const (Tuple<Object, num>):
        if (item2 is num) {
          return (item2 as num) - (other as Tuple<Object, num>).item2;
        } else {
          throw UnsupportedError(errorTupleMinusOperator);
        }
      case num:
      case int:
        return (item2 as num) - (other as num);
      default:
        throw UnsupportedError(errorTupleMinusOperator);
    }
  }
}
