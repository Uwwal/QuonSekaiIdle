/// 战斗敌人

import 'dart:math';

import 'package:quon_sekai_idle/models/world/combat/status.dart';
import 'package:quon_sekai_idle/models/world/player.dart';

import '../../abstract/entity.dart';

import 'package:json_annotation/json_annotation.dart';

import '../../enum/body_part.dart';
import '../../managers/enemy_manager.dart';
import 'action.dart';

part 'enemy.g.dart';

class Enemy extends Entity implements Comparable<Enemy> {
  Enemy(id, maxHp, maxSlotLen, level, actionInterval, combatActionList, status,
      {equipmentMap})
      : super(id, maxHp, maxSlotLen, level, actionInterval, combatActionList,
            status,
            equipmentMap: equipmentMap) {
    target = Player.getPlayerInstance();
  }

  @override
  int compareTo(Enemy other) {
    return id - other.id;
  }

  factory Enemy.fromJson(Map<String, dynamic> json) => Enemy(
        json['id'],
        json['maxHp'],
        json['maxSlotLen'],
        json['level'],
        json['actionInterval'],
        (json['combatActionList'] as List<dynamic>)
            .map((actionJson) => CombatAction.fromJson(actionJson))
            .toList(),
        CombatStatus.fromJson(json['status']),
        equipmentMap: json['equipmentMap'],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'hp': hp,
        'maxHp': maxHp,
        'maxSlotLen': maxSlotLen,
        'level': level,
        'actionInterval': actionInterval,
        'combatActionList':
            combatActionList.map((action) => action.toJson()).toList(),
        'status': status.toJson(),
        'equipmentMap':
            equipmentMap.map((k, e) => MapEntry(_$BodyPartEnumMap[k]!, e.toJson())),
      };
}

/// world的属性, 根据enemyList的id和权重weightList生成敌人
@JsonSerializable()
class EnemyList {
  List<int> enemyList;
  List<int> weightList;

  final int sum;
  final int len;

  EnemyList(this.enemyList, this.weightList)
      : sum = weightList.reduce((value, element) => value + element),
        len = enemyList.length;

  factory EnemyList.fromJson(Map<String, dynamic> json) =>
      _$EnemyListFromJson(json);
  Map<String, dynamic> toJson() => _$EnemyListToJson(this);

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

/// 实例化过的敌人存储在这里
abstract class EnemyPool {
  /// 存储已实例化过的Enemy
  static final List<Enemy> _pool = [];

  static int _findIndex(int id) {
    var index = -1;
    for (Enemy enemy in _pool) {
      index++;

      var sub = enemy.id - id;
      if (sub < 0) {
        /// enemy.id < id
        return -1;
      } else if (sub == 0) {
        return index;
      }
    }
    return -1;
  }

  static Enemy _createObject(int id) => EnemyManager.get(id);

  /// 外部归还不要的敌人
  static void repayEnemy(Enemy enemy) {
    _pool.add(enemy);
    _pool.sort();
  }

  /// 外部借用实例化的敌人
  static Enemy lendEnemy(int id) {
    if (_pool.isEmpty) {
      return _createObject(id);
    } else {
      var index = _findIndex(id);

      return index == -1 ? _createObject(id) : _pool.removeAt(index);
    }
  }
}

const _$BodyPartEnumMap = {
  BodyPart.head: 'head',
  BodyPart.body: 'body',
  BodyPart.hand: 'hand',
};
