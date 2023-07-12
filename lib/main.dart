import 'package:flutter/material.dart';
import 'package:sky_scrapper_api_flutter_app/views/screens/SplashScreen.dart';
import 'package:sky_scrapper_api_flutter_app/views/screens/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute: "splash_screen",
      routes: {
        '/': (context) => const HomePage(),
        'splash_screen': (context) => const SplashScreen(),
      },
    ),
  );
}
