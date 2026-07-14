import 'package:flutter/material.dart';
import 'package:spece/App_theme.dart';
import 'package:spece/home_screen.dart';
import 'package:spece/layers.dart';
import 'package:spece/widget/planet_details.dart';


void main() {
  runApp(const SpaceApp());
}
class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        Layers.routeName:(_) => const Layers(),
        PlanetDetails.routeName: (_) =>  PlanetDetails(),
      },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}