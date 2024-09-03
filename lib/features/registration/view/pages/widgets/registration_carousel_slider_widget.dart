import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stellarlist/features/registration/data/models/registration_introduction_model.dart';

class RegistrationCarouselSliderWidget extends StatefulWidget {
  const RegistrationCarouselSliderWidget({super.key});

  @override
  State<RegistrationCarouselSliderWidget> createState() => _RegistrationCarouselSliderWidgetState();
}

class _RegistrationCarouselSliderWidgetState extends State<RegistrationCarouselSliderWidget> {
  double _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
    );
  }
}
