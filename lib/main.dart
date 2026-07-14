import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/views/category_search_view.dart';
import 'package:flux_store/features/home/ui/home_screen.dart';

void main() {
  runApp(FluxStore());
}

class FluxStore extends StatelessWidget {
  const FluxStore({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: MaterialApp(
        routes: {
          CategorySearch.id: (context) => CategorySearch(),
          HomeScreen.id: (context) => HomeScreen(),
        },
        initialRoute: HomeScreen.id,
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
