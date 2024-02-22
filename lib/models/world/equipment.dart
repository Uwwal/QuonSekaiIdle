/// 实体的装备

import 'package:json_annotation/json_annotation.dart';

import '../../utils/effect_util.dart';
import '../enum/body_part.dart';
import '../enum/effect_type.dart';
import 'combat/damage.dart';
import 'combat/damage_dice.dart';
import 'combat/effect_list.dart';

part 'equipment.g.dart';

// todo clear debug

/// todo 需要重新构想关于id等应对以后的功能扩展
/// 创建后根据id生成effectList
class Equipment {
  void use() {
    // todo
    throw Error();
  }

  String name;

  BodyPart bodyPart;

  List<DamageDice> damageDiceList;

  // EffectList effectList;

  Equipment(this.name, this.bodyPart, this.damageDiceList,
      {EffectList? effectList});

  // Equipment(this.name, this.bodyPart, this.damageDiceList,
  //     {EffectList? effectList})
  //     : effectList = effectList ?? EffectList();

  factory Equipment.fromJson(Map<String, dynamic> json) =>
      _$EquipmentFromJson(json);
  Map<String, dynamic> toJson() => _$EquipmentToJson(this);

  List<Damage> getDamage() {
    List<Damage> res = [];
    for (var d in damageDiceList) {
      res.add(d.getDamage());
    }
    res.sort();
    return res;
  }

  // void modifyOutgoingDamage(List<Damage> damageList) =>
  //     modifyDamage(damageList, EffectType.modifyOutgoingDamageNum, effectList);
  //
  // void modifyIncomingDamage(List<Damage> damageList) =>
  //     modifyDamage(damageList, EffectType.modifyIncomingDamageNum, effectList);

  // @override
  // int compareTo(Equipment other) {
  //   return bodyPart.index - other.bodyPart.index;
  // }
}

