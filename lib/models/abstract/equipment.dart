import '../../utils/effect_util.dart';
import '../enum/body_part.dart';
import '../enum/effect_type.dart';
import '../world/combat/damage.dart';
import '../world/combat/damage_dice.dart';
import '../world/combat/effect_list.dart';

abstract class Equipment {
  void use() {
    // todo
    throw Error();
  }

  String name;

  BodyPart bodyPart;

  List<DamageDice> damageDiceList;

  EffectList effectList;

  Equipment(this.name, this.bodyPart, this.damageDiceList,
      {EffectList? effectList})
      : effectList = effectList ?? EffectList();

  List<Damage> getDamage() {
    List<Damage> res = [];
    for (var d in damageDiceList) {
      res.add(d.getDamage());
    }
    res.sort();
    return res;
  }

  void modifyOutgoingDamage(List<Damage> damageList) =>
      modifyDamage(damageList, EffectType.modifyOutgoingDamageNum, effectList);

  void modifyIncomingDamage(List<Damage> damageList) =>
      modifyDamage(damageList, EffectType.modifyIncomingDamageNum, effectList);

  // @override
  // int compareTo(Equipment other) {
  //   return bodyPart.index - other.bodyPart.index;
  // }
}

class EmptyHead extends Equipment {
  EmptyHead() : super("空", BodyPart.head, []);
}

class EmptyBody extends Equipment {
  EmptyBody() : super("皮肤", BodyPart.body, []);
}

class EmptyHand extends Equipment {
  EmptyHand() : super("手", BodyPart.hand, []);
}
