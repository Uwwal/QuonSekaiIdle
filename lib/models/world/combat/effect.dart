import 'package:json_annotation/json_annotation.dart';

import '../../enum/effect_type.dart';
import 'damage.dart';

part 'effect.g.dart';

@JsonSerializable()
class Effect {
  int id;
  EffectType type;
  List<num> numList;
  int functionId;

  @JsonKey(includeFromJson:false,includeToJson: false)
  late Function(List<Damage> damageList) modifyDamage;

  Effect(this.id, this.type, this.numList,
      {this.functionId = 0})
      : modifyDamage = modifyDamageFunc(id);

  factory Effect.fromJson(Map<String, dynamic> json) => _$EffectFromJson(json);
  Map<String, dynamic> toJson() => _$EffectToJson(this);
}

Function(List<Damage>) modifyDamageFunc(int id){
  return (List<Damage> damageList){return damageList;};
}