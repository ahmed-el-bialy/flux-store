import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/categories/data/repo/categories_repo.dart';

import '../../home/data/models/product_model.dart';

part 'products_by_category_state.dart';

class ProductsByCategoryCubit extends Cubit<ProductsByCategoryState> {
  ProductsByCategoryCubit({required this.categoriesRepo})
    : super(ProductsByCategoryInitial());

  final CategoriesRepo categoriesRepo;
  List<ProductModel>? products;

  Future<void> getAllProducts({required String category}) async {
    emit(ProductsByCategoryLoading());

    try {
      products = await categoriesRepo.getProductsByCategory(category: category);
      emit(ProductsByCategorySuccess(products: products ?? []));
    } catch (e) {
      emit(ProductsByCategoryFailed(errorMessage: e.toString()));
    }
  }
}
