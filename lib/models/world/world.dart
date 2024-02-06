import 'package:quon_sekai_idle/constants/world_constants.dart';
import 'package:quon_sekai_idle/models/world/player.dart';

import 'combat/enemy.dart';

class World{
  static World _world = World._internal(defaultWorldEnemyList);

  EnemyList enemyList;

  late Enemy enemy;

  // WorldType type;

  World._internal(this.enemyList);

  void changeWorld(EnemyList enemyList) => _world = World._internal(enemyList);

  Enemy generateEnemy(){
    enemy = enemyList.generateEnemy();
    return enemy;
  }

  void finishCombat(){
    enemy.finishCombat();
    Player.getPlayerInstance().finishCombat();
  }
}
// todo 0207 finishCombat: world和player交互

// todo
// enum WorldType {
// }