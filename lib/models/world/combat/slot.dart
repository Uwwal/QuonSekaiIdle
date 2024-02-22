/// 充能

import 'package:json_annotation/json_annotation.dart';

import '../../enum/slot_type.dart';

part 'slot.g.dart';

/// todo 序列化用于action中的slotTupleList 需要讨论是否需要序列化
/// 链表node
@JsonSerializable()
class Slot implements Comparable<Slot>{
  int index;
  SlotType type;

  @JsonKey(includeFromJson:false,includeToJson: false)
  String test;
  @JsonKey(includeFromJson:false,includeToJson: false)
  Slot? next;
  @JsonKey(includeFromJson:false,includeToJson: false)
  Slot? prev;

  Slot({this.type = SlotType.empty, this.index = -1, this.test = '1',});

  factory Slot.fromJson(Map<String, dynamic> json) => _$SlotFromJson(json);
  Map<String, dynamic> toJson() => _$SlotToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Slot && index == other.index;
  }

  @override
  int get hashCode => index.hashCode;

  @override
  int compareTo(Slot other) {
    return index - other.index;
  }
}
