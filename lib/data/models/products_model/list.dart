import 'package:json_annotation/json_annotation.dart';

part 'list.g.dart';

@JsonSerializable()
class Lists {
  String? id;
  String? title;
  String? des;
  bool? isActive;
  int? price;
  int? discount;
  bool? isSelected;

  Lists({
    this.id,
    this.title,
    this.des,
    this.isActive,
    this.price,
    this.discount,
    this.isSelected,
  });

  factory Lists.fromJson(Map<String, dynamic> json) => _$ListsFromJson(json);

  Map<String, dynamic> toJson() => _$ListsToJson(this);
}
