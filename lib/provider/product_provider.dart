import 'package:flutter/material.dart';
import 'package:providerskel/data/models/products_model/category.dart';
import 'package:providerskel/data/models/products_model/data.dart';
import 'package:providerskel/data/models/products_model/product.dart';
import 'package:providerskel/data/repos/product_repo.dart';
import 'package:providerskel/provider/custom_mixin.dart';

class ProductProvider with ChangeNotifier, CustomNotifierMixin {
  static final ProductProvider _singleton = ProductProvider._internal();
  ProductProvider._internal();
  factory ProductProvider() => _singleton;

  bool isLoading = false;
  bool isLoadingMore = false; // For pagination loading indicator
  bool hasError = false;
  List<Product> product = [];
  List<Category> category = [];
  int _currentPage = 1; // Track the current page
  bool _hasMore = true; // Check if more products exist
  String? _currentCategoryId;

  /// Fetch products (Initial load)
  Future<void> getProducts(String? categoryId, {int page = 1}) async {
    isLoading = true;
    _currentPage = 1; // Reset pagination when loading new category
    _currentCategoryId = categoryId;
    notifyListeners();

    await ProductRepository()
        .products(categoryId: categoryId, page: page)
        .then((value) {
      value.fold(
        (l) {
          isLoading = false;
          hasError = true;
          product = [];
          category = [];
        },
        (r) {
          isLoading = false;
          hasError = false;
          product = r.data?.products ?? [];
          category = r.data?.categories ?? [];
          _hasMore = r.data?.products?.isNotEmpty ??
              false; // Check if we have more products
        },
      );
    });

    notifyListeners();
  }

  /// Fetch specific category products
  Future<void> getSpecificProducts(String? categoryId, {int page = 1}) async {
    isLoading = true;
    _currentPage = 1; // Reset page when switching categories
    _currentCategoryId = categoryId;
    notifyListeners();

    await ProductRepository()
        .products(categoryId: categoryId, page: page)
        .then((value) {
      value.fold(
        (l) {
          isLoading = false;
          hasError = true;
          product = [];
        },
        (r) {
          isLoading = false;
          hasError = false;
          product = r.data?.products ?? [];
          _hasMore = r.data?.products?.isNotEmpty ??
              false; // Check if more products exist
        },
      );
    });

    notifyListeners();
  }

  /// Load more products (Pagination)
  Future<void> loadMore() async {
    print("calling");
    if (isLoadingMore || !_hasMore) return; // Prevent multiple calls

    isLoadingMore = true;
    notifyListeners();

    int nextPage = _currentPage + 1;

    await ProductRepository()
        .products(categoryId: _currentCategoryId, page: nextPage)
        .then((value) {
      value.fold(
        (l) {
          isLoadingMore = false;
          hasError = true;
        },
        (r) {
          isLoadingMore = false;
          hasError = false;

          List<Product>? newProducts = r.data?.products ?? [];

          if (newProducts.isNotEmpty) {
            product.addAll(newProducts);
            _currentPage = nextPage; // Update page number
          } else {
            _hasMore = false; // No more products available
          }
        },
      );
    });

    notifyListeners();
  }
}
