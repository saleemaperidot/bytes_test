import 'package:json_annotation/json_annotation.dart';
import 'package:providerskel/data/models/products_model/image_models/image_models.dart';

import 'choice.dart';
import 'image.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: '_id')
  String? id;
  int? price;
  int? discountPrice;
  String? title;
  int? quantity;
  int? maxQuantity;
  List<ImageModels>? image;
  bool? status;
  String? statusText;
  List<dynamic>? discounts;
  String? type;
  bool? isCustomisable;
  List<Choice>? choice;

  Product({
    this.id,
    this.price,
    this.discountPrice,
    this.title,
    this.quantity,
    this.maxQuantity,
    this.image,
    this.status,
    this.statusText,
    this.discounts,
    this.type,
    this.isCustomisable,
    this.choice,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
