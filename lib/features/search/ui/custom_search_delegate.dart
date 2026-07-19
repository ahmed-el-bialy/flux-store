import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/theming/app_colors.dart';
import 'package:flux_store/features/search/ui/widgets/build_search_result_grid.dart';

import '../logic/search_cubit.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchCubit searchCubit;

  Timer? searchTimeResponse;
  String lastQuery = '';

  CustomSearchDelegate({required this.searchCubit});

  @override
  String? get searchFieldLabel => 'Search for products';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: AppColors.white),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: AppColors.grayText, fontSize: 16.sp),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(color: AppColors.black, fontSize: 16.sp),
      ),
    );
  }

  @override
  List<Widget>? buildActions(context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear, color: AppColors.blue),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.filter_alt, color: AppColors.black),
      ),
    ];
  }

  @override
  Widget? buildLeading(context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back, color: AppColors.blue),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(context) {
    if (query.isEmpty) {
      lastQuery = "";
      return Container(color: AppColors.white);
    }
    final currentQuery = query.trim();
    if (currentQuery == lastQuery) {
      return BuildSearchResultsGrid(searchCubit: searchCubit);
    }

    if (searchTimeResponse?.isActive ?? false) searchTimeResponse!.cancel();

    searchTimeResponse = Timer(const Duration(milliseconds: 800), () {
      lastQuery = currentQuery;
      searchCubit.searchForProduct(query: query.trim());
    });

    return BuildSearchResultsGrid(searchCubit: searchCubit);
  }
}
