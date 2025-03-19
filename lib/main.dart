import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:to_do_app/core/helper/helper.dart';
import 'package:to_do_app/core/theme/app_theme_data.dart';
import 'package:to_do_app/features/on_baording/start_screen/presentation/start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Helper().init();
  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'To Do',
      // theme: AppThemeData.darkThemeData, // Dark Theme
      // themeMode: ThemeMode.light, // Change to ThemeMode.system for auto mode
      theme: AppThemeData.lightThemeData,
      home: StartScreen(),
    );
  }
}
