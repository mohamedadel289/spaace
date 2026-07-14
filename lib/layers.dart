import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:spece/App_theme.dart';
import 'package:spece/Model/Planet_model.dart';
import 'package:spece/planet_veiw.dart';
import 'package:spece/widget/button_widget.dart';
import 'package:spece/widget/planet_details.dart';

class Layers extends StatefulWidget {
  static const String routeName = '/layers';
  const Layers({super.key});
  @override
  State<Layers> createState() => _LayersState();
}

class _LayersState extends State<Layers> {
  int currentIndex = 0;
  final LoopPageController controller = LoopPageController();
  PlanetModel get selectedPlanet => PlanetData.planets[currentIndex];

  void nextPlanet() {
    if (currentIndex < PlanetData.planets.length - 1) {
      setState(() => currentIndex++);
    }
  }

  void previousPlanet() {
    if (currentIndex > 0) {
      setState(() => currentIndex--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.primary,
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.5,
                    child: Image.asset('assets/images/image2.png'),
                  ),
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppTheme.primary.withValues(alpha: 0),
                            AppTheme.primary,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        'Explore',
                        style: TextStyle(
                          fontSize: 24,
                          color: AppTheme.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 169,
                    left: 20,
                    right: 69,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Which planet\nwould you like to explore?',
                        style: TextStyle(
                          fontSize: 24,
                          color: AppTheme.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PlanetVeiw(
              controller: controller,
              currentPlanet: selectedPlanet,
              onNext: () {
                if (currentIndex < PlanetData.planets.length - 1) {
                  controller.animateToPage(
                    currentIndex + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },

              onPrevious: () {
                if (currentIndex > 0) {
                  controller.animateToPage(
                    currentIndex - 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            SizedBox(height: 20),
            ButtonWidget(
              buttonText: 'Explore ${selectedPlanet.name}',
              planetData: selectedPlanet,
              onPressed: () {
                Navigator.of(
                  context,
                ).pushNamed(PlanetDetails.routeName, arguments: selectedPlanet);
              },
            ),
          ],
        ),
      ),
    );
  }
}
