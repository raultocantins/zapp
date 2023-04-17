import 'package:flutter/material.dart';
import 'package:zapp/src/features/splash/splash_page.dart';

import 'config/getIt/register_dependencies.dart';
import 'src/features/home/presenter/page/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  registerDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Z',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          background: Colors.white,
          onBackground: Colors.white,
          primary: Color(0xfff52d55),
          onPrimary: Color(0xfff52d55),
          secondary: Color(0XFF161515),
          onSecondary: Color(0XFF161515),
          error: Colors.red,
          onError: Colors.red,
          surface: Color(0xfff8f8f8),
          onSurface: Color(0xfff8f8f8),
          onPrimaryContainer: Color(0xff10375C),
        ),
      ),
      routes: {
        "/home": (context) => const HomePage(),
      },
      home: const SplashPage(),
    );
  }
}
