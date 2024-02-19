import 'package:flutter/material.dart';
import 'package:noti/pages/login_page.dart';
import 'package:noti/util/main_theme_data.dart';
import 'package:noti/pages/notification.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mainThemeData,
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      routes: {
        '/notifications': (context) => const Notifications(),
      },
    );
  }
}
