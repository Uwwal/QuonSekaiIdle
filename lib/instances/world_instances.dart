import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:quon_sekai_idle/models/enum/world_type.dart';

import '../models/world/combat/enemy.dart';

abstract class WorldInstances {
  static Map<String, dynamic> get(int id) {
    var map = _worldJsonList[id];

    return {
      'enemyList': EnemyList.fromJson(map['enemyList'] as Map<String, dynamic>),
      'type': $enumDecode(_$WorldTypeEnumMap, map['type']),
    };
  }

  static final List<dynamic> _worldJsonList = json.decode(_allWorldJson);
}

const _$WorldTypeEnumMap = {
  WorldType.serene: 0,
  WorldType.calm: 1,
};

String _allWorldJson = '''
[
  {"enemyList": {"enemyList": [1, 2, 3], "weightList": [4, 5, 6]}, "type": 0},
  {"enemyList": {"enemyList": [1, 2, 3], "weightList": [4, 5, 6]}, "type": 1}
]
''';
// todo 补充json

// World _$WorldFromJson(Map<String, dynamic> json) => World(
//   json['id'] as int,
//   EnemyList.fromJson(json['enemyList'] as Map<String, dynamic>),
//   $enumDecode(_$WorldTypeEnumMap, json['type']),
// );
//
// Map<String, dynamic> _$WorldToJson(World instance) => <String, dynamic>{
//   'id': instance.id,
//   'enemyList': instance.enemyList,
//   'type': _$WorldTypeEnumMap[instance.type]!,
// };
