/// 充能类型

enum SlotType {
  empty,
  shapeChange,    // 形变
  flame,          // 火焰
}

final List<SlotType> slotTypeList =
    List.generate(SlotType.values.length, (index) => SlotType.values[index]);
