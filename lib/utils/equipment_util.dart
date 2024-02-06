import '../models/abstract/equipment.dart';
import '../models/enum/body_part.dart';

void ensureEmptySafeMap(Map<BodyPart, Equipment> equipmentMap) {
  for (var bodyPart in bodyPartList) {
    if (equipmentMap[bodyPart] == null) {
      switch (bodyPart) {
        case BodyPart.head:
          equipmentMap[bodyPart] = EmptyHead();
          break;
        case BodyPart.body:
          equipmentMap[bodyPart] = EmptyBody();
          break;
        case BodyPart.hand:
          equipmentMap[bodyPart] = EmptyHand();
          break;
      }
    }
  }
}
