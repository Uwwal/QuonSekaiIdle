import '../models/enum/body_part.dart';
import '../models/world/equipment.dart';

class EmptyHead extends Equipment {
  EmptyHead() : super("空", BodyPart.head, []);
}

class EmptyBody extends Equipment {
  EmptyBody() : super("皮肤", BodyPart.body, []);
}

class EmptyHand extends Equipment {
  EmptyHand() : super("手", BodyPart.hand, []);
}