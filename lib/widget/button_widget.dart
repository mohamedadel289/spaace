
import 'package:flutter/material.dart';
import 'package:spece/App_theme.dart';
import 'package:spece/Model/Planet_model.dart';
import 'package:spece/layers.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final PlanetModel planetData;
  final VoidCallback? onPressed;
  const ButtonWidget({super.key, required this.buttonText, required this.planetData, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17.0, right: 16.0, bottom: 22.0),
      child: ElevatedButton(
        onPressed: onPressed ?? () => Navigator.of(context).pushNamed(Layers.routeName),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.red,
          foregroundColor: AppTheme.white,
          elevation: 0,
          minimumSize: Size(342, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              buttonText.isEmpty ? 'Explore' : buttonText,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.arrow_forward, size: 24),
          ],
        ),
      ),
    );
  }
}
