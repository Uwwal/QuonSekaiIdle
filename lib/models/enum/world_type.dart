import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'type')
enum WorldType {
  serene(0),
  calm(1);

  final int type;

  const WorldType(this.type);
}