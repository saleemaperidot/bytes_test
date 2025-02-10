import 'package:json_annotation/json_annotation.dart';

part 'image_models.g.dart';

@JsonSerializable()
class ImageModels {
  String? url;

  ImageModels({this.url});

  factory ImageModels.fromJson(Map<String, dynamic> json) {
    return _$ImageModelsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ImageModelsToJson(this);
}
