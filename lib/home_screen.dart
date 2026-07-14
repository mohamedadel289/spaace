

import 'package:flutter/material.dart';
import 'package:spece/App_theme.dart';
import 'package:spece/Model/Planet_model.dart';
import 'package:spece/widget/button_widget.dart';


class HomeScreen extends StatelessWidget {
  static const String routeName = '/home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              right: 33,
              bottom: 33,
              child: Image.asset(
                'assets/images/planet1.png',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 170.0, bottom: 80.0,),
                child: Text(
                  'Explore\nThe\nUniverse ',
                  style: TextStyle(
                    fontSize: 48,
                    color: AppTheme.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: ButtonWidget(buttonText: 'Explore',
               planetData: PlanetData.planets[0]),
            ),
          ],
        ),
      ),
    );
  }
}
