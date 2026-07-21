import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helper/shared_prefs_helper.dart';
import 'package:flux_store/core/networking/dio_factory.dart';
import 'package:flux_store/features/auth/data/repo/auth_repo.dart';
import 'package:flux_store/features/auth/data/web_services/auth_api_service.dart';
import 'package:flux_store/features/auth/logic/auth_cubit.dart';

import 'core/routing/app_router.dart';
import 'core/routing/route_names.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsHelper.init();
  final isLoggedIn = SharedPrefsHelper.isLoggedIn();
  runApp(VibrantStoreApp(appRouter: AppRouter(), isLoggedIn: isLoggedIn));
}

class VibrantStoreApp extends StatelessWidget {
  const VibrantStoreApp({
    super.key,
    required this.appRouter,
    required this.isLoggedIn,
  });

  final AppRouter appRouter;
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => AuthCubit(
            authRepo: AuthRepo(AuthApiService(DioFactory.getDio())),
          )..checkSession(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        ensureScreenSize: true,
        builder: (_, child) {
          return MaterialApp(
            initialRoute: isLoggedIn ? RouteNames.home : RouteNames.signIn,
            onGenerateRoute: appRouter.generateRoute,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
