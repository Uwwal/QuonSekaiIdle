/// 根据id返回实例化的Effect

import 'dart:convert';

import 'package:quon_sekai_idle/models/world/combat/effect.dart';

abstract class EffectManager {
  static Effect get(int id) {
    var effectJson = _effectJsonList[id];

    return Effect.fromJson(effectJson);
  }

  static final List<dynamic> _effectJsonList = json.decode(_allEffectJson);
}

// const _$EffectTypeEnumMap = {
//   EffectType.modifyOutgoingDamageNum: 0,
//   EffectType.modifyIncomingDamageNum: 1,
//   EffectType.modifyStatus: 2,
//   EffectType.modifyActionInterval: 3,
// };

String _allEffectJson = '''
[
  {"id":0,"type":0, "numList": },
  {"id":1,},
  {"id":2,},
  {"id":3,"maxHp":80,"maxSlotLen":4,"level":8,"actionInterval":1,"combatActionList":["Attack","Defend"],"status":"Alive","equipmentMap":{}}
]
''';
