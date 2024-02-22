import 'package:flutter_test/flutter_test.dart';
import 'package:quon_sekai_idle/models/world/world.dart';

void main() {
  test('default_world', () {
    var world = World.getWorldInstance();

    expect(world.id, 0);
  });

  test('change_world', () {
    World.changeWorld(1);

    var world = World.getWorldInstance();

    expect(world.id, 1);
  });

  test('generate_enemy', () {
    var world = World.getWorldInstance();

    var enemy = world.generateEnemy();

    // expect(enemy.id, matcher)
  });

}
