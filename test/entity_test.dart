import 'package:flutter_test/flutter_test.dart';
import 'package:quon_sekai_idle/models/enum/slot_type.dart';
import 'package:quon_sekai_idle/models/world/combat/action.dart';
import 'package:quon_sekai_idle/models/world/combat/enemy.dart';
import 'package:quon_sekai_idle/models/world/combat/slot.dart';
import 'package:quon_sekai_idle/models/world/combat/slot_repository.dart';
import 'package:quon_sekai_idle/models/world/combat/status.dart';
import 'package:quon_sekai_idle/utils/tuple_util.dart';

void main() {
  test('to json', () {
    var enemy = Enemy(
        1,
        20,
        5,
        100,
        1000,
        [
          CombatAction(
              true,
              "T1",
              [1, 2, 3],
              50,
              SlotTupleList([
                Tuple<Slot, int>(Slot(), 1),
                Tuple<Slot, int>(Slot(index: 1, type: SlotType.flame), 2)
              ]),
              SlotTupleList(
                  [Tuple<Slot, int>(Slot(index: 1, type: SlotType.flame), 3)])),
          CombatAction(
              true,
              "T2",
              [3, 4, 5],
              250,
              SlotTupleList([
                Tuple<Slot, int>(Slot(), 1),
                Tuple<Slot, int>(Slot(index: 1, type: SlotType.flame), 2)
              ]),
              SlotTupleList(
                  [Tuple<Slot, int>(Slot(index: 1, type: SlotType.flame), 3)]))
        ],
        CombatStatus([1, 2, 3, 4, 5, 6, 7, 8]));

    var json = enemy.toJson();

    print(json);

    print(1);

  });

  test('enum and json', () {});

  test('json s', () {
    // var world = World(1,EnemyList([1,2,3],[4,5,6]), WorldType.serene);
    //
    // var json = world.toJson();
    //
    // print(json);
    //
    // var world2 = World.fromJson(json);

    print(1);
  });
}
