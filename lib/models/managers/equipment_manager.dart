/// todo 等待重写

import '../enum/body_part.dart';
import '../world/equipment.dart';

class EmptyHead extends Equipment {
  EmptyHead() : super("空", BodyPart.head, []);
}

class EmptyBody extends Equipment {
  EmptyBody() : super("皮肤", BodyPart.body, []);
}

class EmptyHand extends Equipment {
  EmptyHand() : super("手", BodyPart.hand, []);
}