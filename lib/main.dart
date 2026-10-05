import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'services/storage_service.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();
  runApp(const AquaLogApp());
}

class AquaLogApp extends StatelessWidget {
  const AquaLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Win',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
