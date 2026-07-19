
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/search/data/repo/search_repo.dart';


import '../../home/data/models/product_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchRepo}) : super(SearchInitial());
  final SearchRepo searchRepo;
  List<ProductModel>? products;

  Future<void> searchForProduct({required String query}) async {
    emit(SearchLoading());

    try {
      products = await searchRepo.search(query: query);
      emit(SearchSuccess(products: products ?? []));
    } catch (e) {
      emit(SearchFailed(errorMessage: e.toString()));
    }
  }
}
