/// 世界类型

import 'package:json_annotation/json_annotation.dart';

/// 大概是描述世界性质, 以及根据类型添加effect
@JsonEnum(valueField: 'type')
enum WorldType {
  serene(0),
  calm(1);

  final int type;

  const WorldType(this.type);
}