import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/core/networking/dio_factory.dart';
import 'package:flux_store/core/routing/route_names.dart';
import 'package:flux_store/features/categories/ui/screens/categories_screen.dart';
import 'package:flux_store/features/categories/ui/screens/category_products_screen.dart';
import 'package:flux_store/features/details/data/repo/details_repo.dart';
import 'package:flux_store/features/details/data/web_services/details_web_services.dart';
import 'package:flux_store/features/details/logic/product_details_cubit.dart';
import 'package:flux_store/features/details/ui/details_screen.dart';
import 'package:flux_store/features/home/data/repo/home_repo.dart';
import 'package:flux_store/features/home/data/web_services/home_web_services.dart';

import '../../features/categories/data/repo/categories_repo.dart';
import '../../features/categories/data/web_services/categories_web_services.dart';
import '../../features/categories/logic/products_by_category_cubit.dart';
import '../../features/home/logic/get_all_products_cubit.dart';
import '../../features/home/ui/home_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => GetAllProductsCubit(
              homeRepo: HomeRepo(HomeWebServices(DioFactory.getDio())),
            )..getAllProducts(),
            child: const HomeScreen(),
          ),
        );

      case RouteNames.details:
        final arguments = setting.arguments as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProductDetailsCubit(
              detailsRepo: DetailsRepo(DetailsWebServices(DioFactory.getDio())),
            )..getProductDetails(id: arguments),
            child: const DetailsScreen(),
          ),
        );

      case RouteNames.categories:
        return MaterialPageRoute(builder: (_) => const CategoriesScreen());

      case RouteNames.categoryProducts:
        final arguments = setting.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProductsByCategoryCubit(
              categoriesRepo: CategoriesRepo(
                CategoriesWebServices(DioFactory.getDio()),
              ),
            )..getAllProducts(category: arguments),
            child: const CategoryProductsScreen(),
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
