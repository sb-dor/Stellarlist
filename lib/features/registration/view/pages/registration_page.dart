import 'package:auto_route/annotations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stellarlist/widgets/blur_container.dart';

@RoutePage()
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          fit: StackFit.loose,
          children: [
            Positioned(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 55),
                    Expanded(
                      child: SizedBox(
                        width: ResponsiveValue<double?>(
                          context,
                          conditionalValues: [
                            const Condition.largerThan(
                              name: TABLET,
                              value: double.infinity,
                            ),
                          ],
                          defaultValue: double.infinity,
                        ).value,
                        child: CarouselSlider.builder(
                          itemCount: 15,
                          options: CarouselOptions(
                            height: ResponsiveValue<double?>(
                              context,
                              conditionalValues: [
                                Condition.smallerThan(
                                  breakpoint: 920,
                                  value: MediaQuery.of(context).size.height * 0.90,
                                ),
                              ],
                              defaultValue: null,
                            ).value,
                            viewportFraction: 0.640,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 4),
                            padEnds: false,
                            // enlargeCenterPage: true,
                          ),
                          itemBuilder: (context, index, index2) {
                            return Container(
                              margin: const EdgeInsets.only(right: 20, left: 20),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              top: 0,
              right: 0,
              width: ResponsiveValue<double>(
                context,
                conditionalValues: [
                  Condition.largerThan(
                    breakpoint: 920,
                    value: MediaQuery.of(context).size.width / 2.85,
                  ),
                  Condition.equals(
                    name: MOBILE,
                    value: MediaQuery.of(context).size.width,
                  ),
                ],
                defaultValue: 320,
              ).value,
              child: const BlurContainer(
                child: Padding(
                  padding: EdgeInsets.only(left: 100 / 2.85, right: 100 / 2.85),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Let's get started",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          height: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Bring your personal email, connect your work later",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white54,
                          height: 1.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
