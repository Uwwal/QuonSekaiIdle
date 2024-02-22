// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CombatStatus _$CombatStatusFromJson(Map<String, dynamic> json) => CombatStatus(
      (json['status'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$CombatStatusToJson(CombatStatus instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
