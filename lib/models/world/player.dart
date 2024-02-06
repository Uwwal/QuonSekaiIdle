import 'package:quon_sekai_idle/models/world/combat/slot_repository.dart';

import '../../constants/player_constants.dart';
import '../abstract/entity.dart';
import 'combat/action.dart';

class Player extends Entity {
  static final Player _player = Player._internal(
      defaultMaxHp,
      defaultSlotList,
      defaultLevel,
      defaultActionInterval,
      defaultCombatActionList,
      defaultStatus);

  // Player(super.maxHp, super.slotRepository, super.level, super.actionInterval, super.combatActionList, super.status);

  Player._internal(
      int maxHp,
      SlotRepository slotRepository,
      int level,
      int actionInterval,
      List<CombatAction> combatActionList,
      List<double> status)
      : super(maxHp, slotRepository, level, actionInterval, combatActionList,
            status);

  static Player getPlayerInstance() {
    return _player;
  }

  @override
  void finishCombat() {
    super.finishCombat();
  }

  void
}
