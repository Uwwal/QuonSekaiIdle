import 'package:quon_sekai_idle/models/enum/damage_type.dart';

class Damage implements Comparable<Damage>{
  int value;
  DamageType type;

  Damage(this.type,this.value,);

  // weapon -> get damage sort
  @override
  int compareTo(Damage other) {
    return type.index - other.type.index;
  }

  // 用于entity受伤求和
  operator +(Damage other){
    return Damage(type, value+other.value);
  }
}

class OngoingDamage extends Damage{
  int duration;

  OngoingDamage(super.value, super.type, this.duration);
}

