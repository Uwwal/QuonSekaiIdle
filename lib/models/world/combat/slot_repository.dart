/// 实体当前的充能槽

import 'package:json_annotation/json_annotation.dart';
import 'package:quon_sekai_idle/models/world/combat/slot.dart';
import 'package:quon_sekai_idle/utils/combat_slot_util.dart';

import '../../../utils/tuple_util.dart';
import '../../enum/slot_type.dart';

part 'slot_repository.g.dart';

/// entity的field
class SlotRepository {
  Slot? head;
  Slot? tail;

  Map<SlotType, List<Slot>> slotMap = {};

  int len;

  final SlotType defaultType = SlotType.empty;

  SlotRepository(this.len) {
    createEmptySlotMap(slotMap);

    slotMap[defaultType] = List<Slot>.generate(len, (i) => Slot(index: i));

    Slot? prev;
    for (var node in slotMap[defaultType]!) {
      if (head == null) {
        head = node;
      } else {
        prev!.next = node;
        node.prev = prev;
      }
      prev = node;
    }
    tail = prev;
  }

  void _deleteSlot(Slot slot) {
    var type = slot.type;
    slotMap[type]!.remove(slot);
  }

  /// len -= num
  bool contractSlot(int num) {
    if (num > len) {
      return false;
    }
    for (var i = 0; i < num; i++) {
      if (tail!.prev != null) {
        _deleteSlot(tail!);
        tail!.prev!.next = null;
        tail = tail!.prev;
      } else {
        _deleteSlot(head!);
        head = null;
        tail = null;
        break;
      }
      len -= 1;
    }
    return true;
  }

  /// len += num
  void expandSlot(int num) {
    for (var curLen = len; curLen < len + num; curLen++) {
      Slot slot = Slot(index: curLen);

      if (len == 0) {
        tail = slot;
        head = slot;
      } else {
        tail!.next = slot;
        slot.prev = tail;
        tail = slot;
      }

      slotMap[defaultType]!.add(slot);
    }
    len += num;
  }

  int getTypeSlotNum(SlotType type) {
    return slotMap[type]!.length;
  }

  /// action消耗充能
  void _consumeStandardSlot(SlotType type, int num) {
    for (int i = 0; i < num; i++) {
      var slot = slotMap[type]![0];

      slotMap[type]!.remove(slot);

      slot.type = defaultType;

      slotMap[defaultType]!.add(slot);
    }
    slotMap[defaultType]!.sort();
  }

  /// 检测是否有足够充能
  /// 以后可能会有检索规则扩展
  bool hasEnoughSlots(
    SlotTupleList consumeSlotTupleList,
    SlotTupleList createSlotTupleList,
  ) {
    num consumeNum = getTypeSlotNum(defaultType);
    for (var tuple in consumeSlotTupleList.list) {
      var slot = tuple[0];
      var num = tuple[1];

      var type = slot.type;
      if (num > getTypeSlotNum(type)) {
        return false;
      }
      consumeNum += num;
    }
    for (var tuple in createSlotTupleList.list) {
      consumeNum -= tuple.item2;
    }

    return consumeNum >= 0;
  }

  /// action消耗充能
  void consumeSlot(SlotTupleList slotTupleList) {
    for (var tuple in slotTupleList.list) {
      var type = tuple[0].type;
      var num = tuple[1];

      _consumeStandardSlot(type, num);
    }
  }

  /// 用于外部显示
  List<Slot> generateSlotList() {
    List<Slot> res = [];

    slotMap.forEach((key, value) {
      res.addAll(value);
    });

    res.sort();

    return res;
  }

  /// action生成充能
  void _createStandardSlot(SlotType type, int num) {
    for (int i = 0; i < num; i++) {
      var slot = slotMap[defaultType]![0];

      slotMap[defaultType]!.remove(slot);

      slot.type = type;

      slotMap[type]!.add(slot);
    }
    slotMap[type]!.sort();
  }

  /// action生成充能
  void createSlot(SlotTupleList slotTupleList) {
    for (var tuple in slotTupleList.list) {
      var type = tuple[0].type;
      var num = tuple[1];

      _createStandardSlot(type, num);
    }
  }
}

/// todo 需要重构 目前不够方便, 序列化也有点问题
/// 主要给action使用
@JsonSerializable()
class SlotTupleList {
  List<Tuple<Slot, int>> list;

  SlotTupleList(this.list);

  factory SlotTupleList.fromJson(Map<String, dynamic> json) =>
      _$SlotTupleListFromJson(json);
  Map<String, dynamic> toJson() => _$SlotTupleListToJson(this);
}
