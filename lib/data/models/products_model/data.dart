import 'package:json_annotation/json_annotation.dart';

import 'category.dart';
import 'pagination.dart';
import 'product.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? title;
  String? status;
  List<Product>? products;
  Pagination? pagination;
  List<Category>? categories;

  Data({
    this.title,
    this.status,
    this.products,
    this.pagination,
    this.categories,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
