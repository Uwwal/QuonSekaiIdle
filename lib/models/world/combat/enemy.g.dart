// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enemy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnemyList _$EnemyListFromJson(Map<String, dynamic> json) => EnemyList(
      (json['enemyList'] as List<dynamic>).map((e) => e as int).toList(),
      (json['weightList'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$EnemyListToJson(EnemyList instance) => <String, dynamic>{
      'enemyList': instance.enemyList,
      'weightList': instance.weightList,
    };
