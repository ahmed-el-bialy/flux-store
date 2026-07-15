import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/core/networking/dio_factory.dart';
import 'package:flux_store/features/details/data/repo/details_repo.dart';
import 'package:flux_store/features/details/data/web_services/details_web_services.dart';
import 'package:flux_store/features/details/logic/product_details_cubit.dart';
import 'package:flux_store/features/details/ui/details_screen.dart';
import 'package:flux_store/features/home/data/repo/home_repo.dart';
import 'package:flux_store/features/home/data/web_services/home_web_services.dart';

import '../../features/home/logic/get_all_products_cubit.dart';
import '../../features/home/ui/home_screen.dart';
import '../constants/app_constants.dart';

class AppRouter {
  Route generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppConstants.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => GetAllProductsCubit(
              homeRepo: HomeRepo(HomeWebServices(DioFactory.getDio())),
            )..getAllProducts(),
            child: const HomeScreen(),
          ),
        );

      case AppConstants.detailsScreen:
        final arguments = setting.arguments as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProductDetailsCubit(
              detailsRepo: DetailsRepo(DetailsWebServices(DioFactory.getDio()))
                ..getProductsDetails(id: arguments),
            ),
            child: DetailsScreen(),
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
