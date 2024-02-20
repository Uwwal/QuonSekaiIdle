// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enemy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Enemy _$EnemyFromJson(Map<String, dynamic> json) => Enemy(
      json['id'],
      json['maxHp'],
      json['maxSlotLen'],
      json['level'],
      json['actionInterval'],
      json['combatActionList'],
      json['status'],
      equipmentMap: json['equipmentMap'],
    )
      ..hp = json['hp'] as int
      ..spd = json['spd'] as int
      ..combatActionCoolDownList =
          (json['combatActionCoolDownList'] as List<dynamic>)
              .map((e) => e as int)
              .toList()
      ..buffEffectList =
          EffectList.fromJson(json['buffEffectList'] as Map<String, dynamic>)
      ..jobEffectList =
          EffectList.fromJson(json['jobEffectList'] as Map<String, dynamic>)
      ..executeCombat = json['executeCombat'] as bool;

Map<String, dynamic> _$EnemyToJson(Enemy instance) => <String, dynamic>{
      'id': instance.id,
      'hp': instance.hp,
      'maxHp': instance.maxHp,
      'maxSlotLen': instance.maxSlotLen,
      'level': instance.level,
      'actionInterval': instance.actionInterval,
      'spd': instance.spd,
      'combatActionList': instance.combatActionList,
      'combatActionCoolDownList': instance.combatActionCoolDownList,
      'status': instance.status,
      'buffEffectList': instance.buffEffectList,
      'jobEffectList': instance.jobEffectList,
      'equipmentMap': instance.equipmentMap
          .map((k, e) => MapEntry(_$BodyPartEnumMap[k]!, e)),
      'executeCombat': instance.executeCombat,
    };

const _$BodyPartEnumMap = {
  BodyPart.head: 'head',
  BodyPart.body: 'body',
  BodyPart.hand: 'hand',
};

EnemyList _$EnemyListFromJson(Map<String, dynamic> json) => EnemyList(
      (json['enemyList'] as List<dynamic>).map((e) => e as int).toList(),
      (json['weightList'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$EnemyListToJson(EnemyList instance) => <String, dynamic>{
      'enemyList': instance.enemyList,
      'weightList': instance.weightList,
    };
