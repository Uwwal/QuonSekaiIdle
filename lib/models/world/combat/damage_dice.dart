import 'dart:math';

import 'package:quon_sekai_idle/models/enum/damage_type.dart';

import 'damage.dart';

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
}

