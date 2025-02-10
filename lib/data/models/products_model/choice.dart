import 'package:json_annotation/json_annotation.dart';

import 'list.dart';

part 'choice.g.dart';

@JsonSerializable()
class Choice {
  String? id;
  String? type;
  String? title;
  String? des;
  bool? isBasePrice;
  List<Lists>? list;

  Choice({
    this.id,
    this.type,
    this.title,
    this.des,
    this.isBasePrice,
    this.list,
  });

  factory Choice.fromJson(Map<String, dynamic> json) {
    return _$ChoiceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChoiceToJson(this);
}
