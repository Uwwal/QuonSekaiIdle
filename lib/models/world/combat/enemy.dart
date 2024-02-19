import 'dart:math';

import 'package:quon_sekai_idle/models/world/player.dart';

import '../../../instances/enemy_instances.dart';
import '../../abstract/entity.dart';

class Enemy extends Entity implements Comparable<Enemy>{
  Enemy(id, maxHp, maxSlotLen, level, actionInterval, combatActionList, status, {equipmentMap})
      : super(id, maxHp, maxSlotLen, level, actionInterval, combatActionList, status, equipmentMap: equipmentMap) {
    target = Player.getPlayerInstance();
  }

  @override
  int compareTo(Enemy other) {
    return id - other.id;
  }
}

class EnemyList {
  List<int> enemyList;
  List<int> weightList;

  final int sum;
  final int len;

  EnemyList(this.enemyList, this.weightList)
      : sum = weightList.reduce((value, element) => value + element),
        len = enemyList.length;

  Enemy generateEnemy() {
    var random = Random().nextInt(sum);

    var cur = 0;
    for (var i = 0; i < len; ++i) {
      cur += weightList[i];
      if (cur >= random) {
        var id = enemyList[i];
        return EnemyPool.lendEnemy(id);
      }
    }
    throw Error();
  }
}

abstract class EnemyPool {
  // 存储已实例化过的Enemy
  static final List<Enemy> _pool = [];

  static int _findIndex(int id) {
    var index = -1;
    for (Enemy enemy in _pool) {
      index++;

      var sub = enemy.id - id;
      if(sub < 0){
        // enemy.id < id
        return -1;
      }else if(sub == 0){
        return index;
      }
    }
    return -1;
  }

  static Enemy _createObject(int id) => EnemyInstances.get(id);

  static void repayEnemy(Enemy enemy){
    _pool.add(enemy);
    _pool.sort();
  }

  static Enemy lendEnemy(int id) {
    if (_pool.isEmpty) {
      return _createObject(id);
    } else {
      var index = _findIndex(id);
      return index == -1 ? _createObject(id) : _pool.removeAt(index);
    }
  }
}
