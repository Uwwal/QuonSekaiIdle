import '../enum/effect_type.dart';
import '../world/combat/damage.dart';

abstract class Effect{
  int id;
  EffectType type;
  List<num> numList;

  Effect(this.id,this.type,this.numList);

  void modifyDamage(List<Damage> damageList);
}
