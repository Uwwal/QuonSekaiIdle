import 'package:flutter_test/flutter_test.dart';
import 'package:quon_sekai_idle/models/enum/slot_type.dart';
import 'package:quon_sekai_idle/models/world/combat/slot.dart';
import 'package:quon_sekai_idle/models/world/combat/slot_repository.dart';
import 'package:quon_sekai_idle/utils/tuple_util.dart';

void main() {
  final flameSlot = Slot(type: SlotType.flame);
  final shapeSlot = Slot(type: SlotType.shapeChange);

  test('combat_slot_create', () {
    SlotRepository slotList = SlotRepository(5);
    expect(slotList.len, 5);
    expect(slotList.slotMap[SlotType.empty]!.length, 5);
  });

  test('combat_slot_change_list_length', () {
    SlotRepository slotList = SlotRepository(5);

    slotList.slotMap[SlotType.empty]![4].test = 'index = 4';
    slotList.slotMap[SlotType.empty]![1].test = 'index = 1';

    expect(slotList.slotMap[SlotType.empty]![3].test, '1');
    expect(slotList.slotMap[SlotType.empty]![4].type, SlotType.empty);

    for (int i = 0; i < 5; i++) {
      expect(slotList.slotMap[SlotType.empty]![i], Slot(index: i));
    }

    slotList.contractSlot(3);
    // 0,1
    expect(slotList.len, 2);
    expect(slotList.slotMap[SlotType.empty]!.length, 2);
    expect(slotList.slotMap[SlotType.empty]![1].next, null);
    expect(slotList.slotMap[SlotType.empty]![1], slotList.tail);
    expect(slotList.tail!.index, 1);

    for (int i = 0; i < 2; i++) {
      expect(slotList.slotMap[SlotType.empty]![i], Slot(index: i));
    }

    slotList.expandSlot(5);
    // 0,1,2,3,4,5,6

    expect(slotList.len, 7);

    expect(slotList.slotMap[SlotType.empty]![4].test, isNot('index = 4'));
    expect(slotList.slotMap[SlotType.empty]![1].test, 'index = 1');

    for (int i = 0; i < 6; i++) {
      expect(slotList.slotMap[SlotType.empty]![i], Slot(index: i));
    }

    expect(slotList.tail!.index, 6);
  });

  test('combat_slot_create_slot', () {
    SlotRepository slotList = SlotRepository(5);

    slotList.slotMap[SlotType.empty]![4].test = 'index = 4';
    slotList.slotMap[SlotType.empty]![1].test = 'index = 1';

    slotList.contractSlot(3);

    slotList.expandSlot(5);
    // 0,1,2,3,4,5,6

    slotList.slotMap[SlotType.empty]![3].test = 'index = 3';

    expect(slotList.slotMap[SlotType.empty]![3].test, 'index = 3');

    slotList
        .createSlot(SlotTupleList([Tuple(flameSlot, 3), Tuple(shapeSlot, 2)]));

    for (int i = 0; i < 3; i++) {
      expect(slotList.slotMap[SlotType.flame]![i].type, SlotType.flame);
      expect(slotList.slotMap[SlotType.flame]![i].index, i);
    }
    for (int i = 3; i < 5; i++) {
      expect(slotList.slotMap[SlotType.shapeChange]![i - 3].type,
          SlotType.shapeChange);
      expect(slotList.slotMap[SlotType.shapeChange]![i - 3].index, i);
    }
    for (int i = 5; i < 7; i++) {
      expect(slotList.slotMap[SlotType.empty]![i - 5].type, SlotType.empty);
      expect(slotList.slotMap[SlotType.empty]![i - 5].index, i);
    }
    Slot s = slotList.head!.next!;
    for (int i = 1; i < 6; i++) {
      expect(s.prev!.next == s, true);
    }

    expect(slotList.slotMap[SlotType.empty]!.length, 2);
    expect(slotList.slotMap[SlotType.flame]!.length, 3);
    expect(slotList.slotMap[SlotType.shapeChange]!.length, 2);

    slotList.consumeSlot(SlotTupleList([Tuple(shapeSlot, 1)]));

    expect(slotList.slotMap[SlotType.empty]!.length, 3);
    expect(slotList.slotMap[SlotType.flame]!.length, 3);
    expect(slotList.slotMap[SlotType.shapeChange]!.length, 1);

    for (int i = 0; i < 3; i++) {
      expect(slotList.slotMap[SlotType.flame]![i].type, SlotType.flame);
      expect(slotList.slotMap[SlotType.flame]![i].index, i);
    }
    expect(
        slotList.slotMap[SlotType.shapeChange]![0].type, SlotType.shapeChange);
    expect(slotList.slotMap[SlotType.shapeChange]![0].index, 4);
    expect(slotList.slotMap[SlotType.empty]![0].type, SlotType.empty);
    expect(slotList.slotMap[SlotType.empty]![0].index, 3);
    for (int i = 5; i < 7; i++) {
      expect(slotList.slotMap[SlotType.empty]![i - 5].type, SlotType.empty);
      expect(slotList.slotMap[SlotType.empty]![i - 5 + 1].index, i);
    }
  });
  test('combat_slot_generate_list', () {
    SlotRepository slotList = SlotRepository(5);
    slotList.slotMap[SlotType.empty]![1].test = 'index = 1';
    slotList.contractSlot(3);
    slotList.expandSlot(5);
    slotList.slotMap[SlotType.empty]![3].test = 'index = 3';
    slotList
        .createSlot(SlotTupleList([Tuple(flameSlot, 3), Tuple(shapeSlot, 2)]));
    slotList.consumeSlot(SlotTupleList([Tuple(shapeSlot, 1)]));
    List l = slotList.generateSlotList();
    expect(l[1].test, 'index = 1');
    expect(l[3].test, 'index = 3');
    expect(l[4].type, SlotType.shapeChange);
  });
}
