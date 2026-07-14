import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:spece/App_theme.dart';

import 'package:spece/Model/Planet_model.dart';

class PlanetVeiw extends StatelessWidget {
  final LoopPageController controller;
  final ValueChanged<int> onPageChanged;
  final PlanetModel currentPlanet;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const PlanetVeiw({
    super.key,
    required this.currentPlanet,
    required this.onNext,
    required this.onPrevious,
    required this.onPageChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 342,
          height: 400,
          child: LoopPageView.builder(
            controller: controller,
            itemCount: PlanetData.planets.length,
            itemBuilder: (context, index) {
              return Image.asset(
                PlanetData.planets[index].path,
                alignment: Alignment.topCenter,
              );
            },
            onPageChanged: onPageChanged,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 17.0, right: 16.0, bottom: 35.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: AppTheme.red,
                child: IconButton(
                  onPressed: onPrevious,
                  icon: Icon(Icons.arrow_back, color: AppTheme.white),
                ),
              ),
              Text(
                currentPlanet.name,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.white,
                ),
              ),
              CircleAvatar(
                radius: 24,
                backgroundColor: AppTheme.red,
                child: IconButton(
                  iconSize: 24,
                  onPressed: onNext,
                  icon: Icon(Icons.arrow_forward, color: AppTheme.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
