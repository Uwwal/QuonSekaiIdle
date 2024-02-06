enum BodyPart {
  head,
  body,
  hand,
}

final List<BodyPart> bodyPartList =
    List.generate(BodyPart.values.length, (index) => BodyPart.values[index]);
