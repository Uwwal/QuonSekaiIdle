/// weapon的属性, 用于产出最原始的伤害以供后续修饰

import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:quon_sekai_idle/models/enum/damage_type.dart';

import 'damage.dart';

part 'damage_dice.g.dart';

/// 3d5+2 对应 3 times +2 min 5+2 max
@JsonSerializable()
class DamageDice{
  DamageType type;

  int times;

  int min;

  int max;

  DamageDice(this.type, this.times, this.min, {int? max}): max = max??min;

  Damage getDamage(){
    var res = 0;
    for(var i = 0; i < times; i++){
      res += Random().nextInt(max - min + 1) + min;
    }
    return Damage(type, res);
  }

  factory DamageDice.fromJson(Map<String, dynamic> json) => _$DamageDiceFromJson(json);
  Map<String, dynamic> toJson() => _$DamageDiceToJson(this);
}

