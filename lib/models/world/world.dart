import 'package:json_annotation/json_annotation.dart';
import 'package:quon_sekai_idle/models/world/player.dart';

import '../enum/world_type.dart';
import '../managers/world_manager.dart';
import 'combat/enemy.dart';

class World{
  // 静态唯一实例，不需要pool
  /* static instance start */
  static World _world = World._internal(0);

  World._internal(this.id) {
    var map = WorldManager.get(id);
    enemyList = map['enemyList'];
    type = map['type'];
    // enemyList = EnemyList([1,2], [2,3]);
    // type = WorldType.calm;
  }

  static World getWorldInstance() {
    return _world;
  }

  // todo 清理无用debug代码

  // World(this.id,this.enemyList,this.type);
  //
  // factory World.fromJson(Map<String, dynamic> json) => _$WorldFromJson(json);
  // Map<String, dynamic> toJson() => _$WorldToJson(this);

  /* static instance over */
  /* override start */
  int id;

  late EnemyList enemyList;

  late WorldType type;

  late Enemy enemy;

  static void changeWorld(int id) {
    _world = World._internal(id);
  }

  Enemy generateEnemy() {
    enemy = enemyList.generateEnemy();
    return enemy;
  }

  void startCombat(){
    Player.getPlayerInstance().startCombat();
    enemy.startCombat();
  }

  void finishCombat() {
    enemy.finishCombat();
    Player.getPlayerInstance().finishCombat();
  }
  /* override over */
}
