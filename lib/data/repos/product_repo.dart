import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:providerskel/data/models/products_model/product.dart';
import 'package:providerskel/data/models/products_model/products_model.dart';
import 'package:providerskel/helpers/api_const.dart';
import 'package:providerskel/helpers/api_helpers/api_helpers.dart';

class ProductRepository {
  Future<Either<String, ProductsModel>> products(
      {String? categoryId, int page = 1}) async {
    final String url = categoryId == null
        ? "$baseUrl/null/$page"
        : "$baseUrl/$categoryId/$page";
    var res = await ApiHelper().get(url);
    print(res);
    if (res is Response) {
      if (res.statusCode == 200 || res.statusCode == 201) {
        ProductsModel responseData = ProductsModel.fromJson(res.data);

        List<Product>? category = responseData.data!.products ?? [];
        print("response data${category}");

        return Right(responseData);
      } else {
        return const Left("");
      }
    }
    return const Left("");
  }
}
