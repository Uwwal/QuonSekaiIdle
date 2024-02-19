import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

String _allEnemyJson = '''
[
  {"id":1,"maxHp":100,"maxSlotLen":5,"level":10,"actionInterval":1,"combatActionList":["Attack","Defend"],"status":"Alive","equipmentMap":{}},
  {"id":2,"maxHp":120,"maxSlotLen":6,"level":12,"actionInterval":1,"combatActionList":["Attack","Defend"],"status":"Alive","equipmentMap":{}},
  {"id":3,"maxHp":80,"maxSlotLen":4,"level":8,"actionInterval":1,"combatActionList":["Attack","Defend"],"status":"Alive","equipmentMap":{}}
]
''';

void main() {
  test('to json', () {
    List<dynamic> list = json.decode(_allEnemyJson);

    var map = list[1];

    var k = map["maxHp"];

    print(1);
  });
}
