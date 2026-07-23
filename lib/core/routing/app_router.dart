import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/core/networking/dio_factory.dart';
import 'package:flux_store/core/routing/route_names.dart';
import 'package:flux_store/features/auth/ui/log_in_screen.dart';
import 'package:flux_store/features/auth/ui/sign_up_screen.dart';
import 'package:flux_store/features/cart/ui/cart_screen.dart';
import 'package:flux_store/features/categories/ui/screens/categories_screen.dart';
import 'package:flux_store/features/categories/ui/screens/category_products_screen.dart';
import 'package:flux_store/features/details/data/repo/details_repo.dart';
import 'package:flux_store/features/details/data/web_services/details_web_services.dart';
import 'package:flux_store/features/details/logic/product_details_cubit.dart';
import 'package:flux_store/features/details/ui/details_screen.dart';

import 'package:flux_store/features/profile/ui/screens/profile_screen.dart';
import 'package:flux_store/features/wishlist/ui/wishlist_screen.dart';

import '../../features/categories/data/repo/categories_repo.dart';
import '../../features/categories/data/web_services/categories_web_services.dart';
import '../../features/categories/logic/products_by_category_cubit.dart';
import '../../features/main_layout/ui/main_layout_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const MainLayoutScreen());

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

      case RouteNames.signIn:
        return MaterialPageRoute(builder: (_) => const LogInScreen());

      case RouteNames.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case RouteNames.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      case RouteNames.cart:
        return MaterialPageRoute(builder: (_) => const CartScreen());

      case RouteNames.wishlist:
        return MaterialPageRoute(builder: (_) => const WishlistScreen());

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
        return MaterialPageRoute(builder: (_) => const MainLayoutScreen());
    }
  }
}
