// Basic smoke test for the Flux Store app.
//
// Verifies that the application can build and render without crashing.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flux_store/core/helper/shared_prefs_helper.dart';
import 'package:flux_store/core/routing/app_router.dart';
import 'package:flux_store/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('App builds and renders correctly', (WidgetTester tester) async {
    // Set up mock SharedPreferences before building the app
    SharedPreferences.setMockInitialValues({});
    await SharedPrefsHelper.init();

    // Set a realistic phone screen size to avoid layout overflows
    tester.view.physicalSize = const Size(360, 690);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    // Build the app with guest mode (not logged in)
    await tester.pumpWidget(
      VibrantStoreApp(appRouter: AppRouter(), isLoggedIn: false),
    );

    // Let ScreenUtilInit complete its async setup
    await tester.pumpAndSettle();

    // Verify the app renders without errors
    expect(find.byType(VibrantStoreApp), findsOneWidget);
  });
}
