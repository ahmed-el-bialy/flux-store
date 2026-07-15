import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/details/data/repo/details_repo.dart';

import '../../home/data/models/product_model.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit({required this.detailsRepo})
    : super(ProductDetailsInitial());

  final DetailsRepo detailsRepo;
  late final ProductModel product;

  Future<void> getProductDetails({required int id}) async {
    emit(ProductDetailsLoading());

    try {
      product = await detailsRepo.getProductsDetails(id: id);
      emit(ProductDetailsLoadedSuccessfully(product: product));
    } catch (e) {
      emit(ProductDetailsFailed(errorMessage: e.toString()));
    }
  }
}
