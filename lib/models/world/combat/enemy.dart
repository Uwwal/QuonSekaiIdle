import 'dart:math';

import '../../abstract/entity.dart';

class Enemy extends Entity{
  Enemy(super.maxHp, super.slotList, super.level, super.actionInterval, super.combatActionList, super.status);
}

class EnemyList{
  List<Enemy> enemyList;
  List<int> weightList;

  final int sum;
  final int len;

  EnemyList(this.enemyList, this.weightList): sum = weightList.reduce((value, element) => value+element), len = enemyList.length;

  Enemy generateEnemy(){
    var random = Random().nextInt(sum);

    var cur = 0;
    for(var i = 0; i<len; ++i){
      cur += weightList[i];
      if(cur >= random){
        return enemyList[i];
      }
    }
    throw Error();
  }
}