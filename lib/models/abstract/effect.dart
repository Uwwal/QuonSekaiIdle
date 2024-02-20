import 'package:json_annotation/json_annotation.dart';

import '../enum/effect_type.dart';
import '../world/combat/damage.dart';

part 'effect.g.dart';

@JsonSerializable()
abstract class Effect{
  int id;
  EffectType type;
  List<num> numList;

  Effect(this.id,this.type,this.numList);

  factory Effect.fromJson(Map<String, dynamic> json) => _$EffectFromJson(json);
  Map<String, dynamic> toJson() => _$EffectToJson(this);

  void modifyDamage(List<Damage> damageList);
}
