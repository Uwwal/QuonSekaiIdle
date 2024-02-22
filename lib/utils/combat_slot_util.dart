import '../models/enum/slot_type.dart';
import '../models/world/combat/slot.dart';

void createEmptySlotMap(Map<SlotType?, List<Slot>> slotMap){
  for(var type in slotTypeList){
    slotMap[type] = [];
  }
}