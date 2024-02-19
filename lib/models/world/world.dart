import 'package:quon_sekai_idle/constants/world_constants.dart';
import 'package:quon_sekai_idle/models/world/player.dart';

import 'combat/enemy.dart';

class World{
  /* static instance start */
  static World _world = World._internal(defaultWorldEnemyList);

  World._internal(this.enemyList);

  static World getWorldInstance() {
    return _world;
  }
  /* static instance over */
  /* override start */
  EnemyList enemyList;

  late Enemy enemy;

  // WorldType type;

  void changeWorld(EnemyList enemyList) {
    _world = World._internal(enemyList);
  }

  Enemy generateEnemy(){
    enemy = enemyList.generateEnemy();
    return enemy;
  }

  void finishCombat(){
    enemy.finishCombat();
    Player.getPlayerInstance().finishCombat();
  }
  /* override over */
}

// todo
// enum WorldType {
// }