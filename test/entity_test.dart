import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:quon_sekai_idle/models/enum/world_type.dart';
import 'package:quon_sekai_idle/models/world/world.dart';

String _allEnemyJson = '''
[
  {"id":1,"maxHp":100,"maxSlotLen":5,"level":10,"actionInterval":1,"combatActionList":["Attack","Defend"],"status":"Alive","equipmentMap":{}},
  {"id":2,"maxHp":120,"maxSlotLen":6,"level":12,"actionInterval":1,"combatActionList":["Attack","Defend"],"status":"Alive","equipmentMap":{}},
  {"id":3,"maxHp":80,"maxSlotLen":4,"level":8,"actionInterval":1,"combatActionList":["Attack","Defend"],"status":"Alive","equipmentMap":{}}
]
''';

String _allWorldJson = '''
[
  {enemyList: {enemyList: [1, 2, 3], weightList: [4, 5, 6]}, type: 0},
  {enemyList: {enemyList: [1, 2, 3], weightList: [4, 5, 6]}, type: 1},
]
''';

Map<String, dynamic> _$WorldToJson(World instance) => <String, dynamic>{
  'id': instance.id,
  'enemyList': instance.enemyList,
  'type': _$WorldTypeEnumMap[instance.type]!,
};

const _$WorldTypeEnumMap = {
  WorldType.serene: 0,
  WorldType.calm: 1,
};

void main() {
  test('to json', () {
    List<dynamic> list = json.decode(_allEnemyJson);

    var map = list[1];

    var k = map["maxHp"];

    print(1);
  });

  test('enum and json', (){
    WorldType worldType = WorldType.serene;

    var json2 = json.decode(_allWorldJson);

    //World.changeWorld

    print(1);
  });

  test('json s', (){
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
