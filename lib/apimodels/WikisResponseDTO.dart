import 'package:flutter_tutorial/apimodels/ItemDTO.dart';
import 'package:json_annotation/json_annotation.dart';

part 'WikisResponseDTO.g.dart';

@JsonSerializable()
class WikisResponseDTO {
  List<ItemDTO> items;

  WikisResponseDTO(this.items);

  factory WikisResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$WikisResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$WikisResponseDTOToJson(this);
}
