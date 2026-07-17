import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/constants/app_constants.dart';

import 'core/routing/app_router.dart';
import 'core/routing/route_names.dart';

void main() {
  runApp(VibrantStoreApp(appRouter: AppRouter()));
}

class VibrantStoreApp extends StatelessWidget {
  const VibrantStoreApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      builder: (_, child) {
        return MaterialApp(
          initialRoute: RouteNames.home,
          onGenerateRoute: appRouter.generateRoute,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
