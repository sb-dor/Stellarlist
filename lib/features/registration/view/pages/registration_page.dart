import 'package:auto_route/annotations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stellarlist/features/registration/data/models/registration_introduction_model.dart';
import 'package:stellarlist/features/registration/domain/repo/registration_repo.dart';
import 'package:stellarlist/features/registration/view/provider/registration_provider.dart';
import 'package:stellarlist/injections/injections.dart';
import 'package:stellarlist/widgets/blur_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class RegistrationPage extends ConsumerStatefulWidget {
  const RegistrationPage({super.key});

  @override
  ConsumerState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends ConsumerState<RegistrationPage> {
  late final CarouselSliderController _carouselSliderController;
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _carouselSliderController = CarouselSliderController();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                    if (ResponsiveBreakpoints.of(context).largerThan(MOBILE))
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.38,
                        height: 55,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SmoothIndicator(
                              offset: _currentPage,
                              onDotClicked: (index) => setState(() {
                                _currentPage = index.toDouble();
                              }),
                              size: const Size(100, 0),
                              count: RegistrationIntroductionModel.data.length,
                              effect: ExpandingDotsEffect(
                                expansionFactor: 4,
                                dotColor: Colors.grey.shade900,
                                activeDotColor: Colors.white,
                                dotHeight: 3,
                                dotWidth: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
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
                          carouselController: _carouselSliderController,
                          itemCount: RegistrationIntroductionModel.data.length,
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
                            autoPlayInterval: const Duration(seconds: 6),
                            padEnds: false,

                            onScrolled: (i) {
                              if (i != null) {
                                _currentPage = i % RegistrationIntroductionModel.data.length;
                                setState(() {});
                              }
                            },
                            autoPlay: ResponsiveValue(
                              context,
                              conditionalValues: [
                                const Condition.equals(name: MOBILE, value: false),
                              ],
                              defaultValue: true,
                            ).value,
                            // enlargeCenterPage: true,
                          ),
                          itemBuilder: (context, index, index2) {
                            final data = RegistrationIntroductionModel.data[index];
                            return Container(
                              margin: const EdgeInsets.only(right: 20, left: 20),
                              decoration: BoxDecoration(
                                color: data.color,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 50),
                                    SizedBox(
                                      width: 300,
                                      child: Text(
                                        data.title,
                                        style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 30,
                                          height: 1.2,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
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
              child: BlurContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 100 / 2.85, right: 100 / 2.85),
                      child: Text(
                        "Let's get started",
                        style: GoogleFonts.inter(
                          fontSize: 40,
                          color: Colors.white,
                          height: 1,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 100 / 2.85, right: 100 / 2.85),
                      child: Text(
                        "Bring your personal email, connect your work later",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: Colors.white54,
                          height: 1.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () async {
                          await ref.read(registrationProviderProvider.notifier).googleAuth(
                                getIt<RegistrationRepo>(),
                              );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.black,
                              size: 20,
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                "Continue with Google",
                                style: GoogleFonts.inter(
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: 250,
                      child: ElevatedButton(
                        clipBehavior: Clip.none,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Colors.black,
                              size: 20,
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                "Continue with Facebook",
                                style: GoogleFonts.inter(
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: 250,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.white.withOpacity(0.4),
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.mail,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                "Continue with email",
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
