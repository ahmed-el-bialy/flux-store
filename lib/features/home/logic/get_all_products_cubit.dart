import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/product_model.dart';
import '../data/repo/home_repo.dart';

part 'get_all_products_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit({required this.homeRepo})
    : super(GetAllProductsInitial());
  final HomeRepo homeRepo;
  List<ProductModel>? products;

  Future<void> getAllProducts() async {
    emit(GetAllProductsLoading());

    try {
      products = await homeRepo.getAllProducts();
      emit(GetAllProductsLoadedSuccessfully(products: products ?? []));
    } catch (e) {
      emit(GetAllProductsFailed(errorMessage: e.toString()));
    }
  }
}
