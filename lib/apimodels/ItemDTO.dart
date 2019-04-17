import 'package:json_annotation/json_annotation.dart';

part 'ItemDTO.g.dart';

@JsonSerializable()
class ItemDTO {
  int id;
  String name;

  ItemDTO(this.id, this.name);

  factory ItemDTO.fromJson(Map<String, dynamic> json) =>
      _$ItemDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDTOToJson(this);
}
