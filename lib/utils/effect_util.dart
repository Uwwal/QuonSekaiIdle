import 'package:quon_sekai_idle/models/world/combat/effect_list.dart';

import '../models/enum/effect_type.dart';
import '../models/world/combat/damage.dart';

void modifyDamage(List<Damage> damageList, EffectType effectType, EffectList effectList) {
  var list = effectList.getEffectTypeList(effectType);

  for(var effect in list){
    effect.modifyDamage(damageList);
  }
}