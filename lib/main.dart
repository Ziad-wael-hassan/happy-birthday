import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hdb/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(
    widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
  );

  Future.delayed(const Duration(seconds: 3), () {
    FlutterNativeSplash.remove();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'pookie',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF000C15)),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF000C15)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
