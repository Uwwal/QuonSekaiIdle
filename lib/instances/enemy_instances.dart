import '../models/world/combat/enemy.dart';
import 'dart:convert';

/*
Enemy(super.id, super.maxHp, super.maxSlotLen, super.level, super.actionInterval,
    super.combatActionList, super.status, {super.equipmentMap}) {
  target = Player.getPlayerInstance();
}
 */

abstract class EnemyInstances {
  static Enemy get(int id) {
    var enemyJson = _enemyJsonList[id];
    Map<String, dynamic> map = json.decode(enemyJson);
    return Enemy(map['id'], map['maxHp'], map['maxSlotLen'], map['level'],
        map['actionInterval'], map['combatActionList'], map['status'],
        equipmentMap: map['equipmentMap']);
  }

  static final List<String> _enemyJsonList = json.decode(_allEnemyJson);
}

String _allEnemyJson = '''
[
  {"id":1,"maxHp":100,"maxSlotLen":5,"level":10,"actionInterval":1,"combatActionList":["Attack","Defend"],"status":"Alive","equipmentMap":{}},
  {"id":2,"maxHp":120,"maxSlotLen":6,"level":12,"actionInterval":1,"combatActionList":["Attack","Defend"],"status":"Alive","equipmentMap":{}},
  {"id":3,"maxHp":80,"maxSlotLen":4,"level":8,"actionInterval":1,"combatActionList":["Attack","Defend"],"status":"Alive","equipmentMap":{}}
]
''';
// todo
