import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'products_model.g.dart';

@JsonSerializable()
class ProductsModel {
  bool? success;
  Data? data;
  String? msg;

  ProductsModel({this.success, this.data, this.msg});

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return _$ProductsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);
}
