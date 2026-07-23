import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/dio_factory.dart';
import '../../../core/widgets/app_navigation_bar.dart';
import '../../cart/ui/cart_screen.dart';
import '../../categories/ui/screens/categories_screen.dart';
import '../../home/data/repo/home_repo.dart';
import '../../home/data/web_services/home_web_services.dart';
import '../../home/logic/get_all_products_cubit.dart';
import '../../home/ui/home_screen.dart';
import '../../profile/ui/screens/profile_screen.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int _currentIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      BlocProvider(
        create: (context) => GetAllProductsCubit(
          homeRepo: HomeRepo(HomeWebServices(DioFactory.getDio())),
        )..getAllProducts(),
        child: const HomeScreen(),
      ),
      const CategoriesScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      extendBody: true,
      bottomNavigationBar: AppNavigationBar(
        activeIndex: _currentIndex,
        onItemTapped: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
