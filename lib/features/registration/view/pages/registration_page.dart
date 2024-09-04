import 'package:animated_visibility/animated_visibility.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stellarlist/features/registration/data/models/registration_introduction_model.dart';
import 'package:stellarlist/features/registration/domain/repo/registration_repo.dart';
import 'package:stellarlist/features/registration/view/pages/animations/slide_and_fade_animation.dart';
import 'package:stellarlist/features/registration/view/provider/registration_provider.dart';
import 'package:stellarlist/features/registration/view/provider/state_model/registration_state_model.dart';
import 'package:stellarlist/injections/injections.dart';
import 'package:stellarlist/services/auto_route_service/auto_route_service.gr.dart';
import 'package:stellarlist/widgets/blur_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/email_registration_widget.dart';
import 'widgets/lets_get_started_registration_widget.dart';
import 'widgets/registration_carousel_slider_widget.dart';

@RoutePage()
class RegistrationPage extends ConsumerStatefulWidget {
  const RegistrationPage({super.key});

  @override
  ConsumerState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends ConsumerState<RegistrationPage> {
  late ProviderSubscription<AsyncValue<RegistrationStateModel?>> _providerSubscription;

  @override
  void initState() {
    super.initState();
    _providerSubscription = ref.listenManual<AsyncValue<RegistrationStateModel?>>(
        registrationProviderProvider, (prev, next) {
      if (next.value?.user != null && context.mounted) {
        AutoRouter.of(context).replaceAll([
          const HomeRoute(),
        ]);
      }
    });
  }

  @override
  void dispose() {
    _providerSubscription.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registerWatch = ref.watch(registrationProviderProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          fit: StackFit.loose,
          children: [
            const RegistrationCarouselSliderWidget(),
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
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      top: 0,
                      left: 0,
                      right: 0,
                      child: SlideAndFadeAnimation(
                        animate: registerWatch.value?.letsGetStartedState !=
                            LetsGetStartedState.showRegistrationButtons,
                        child: LetsGetStartedRegistrationWidget(),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      top: 0,
                      left: 0,
                      right: 0,
                      child: const EmailRegistrationWidget(),
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
