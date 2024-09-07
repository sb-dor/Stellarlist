import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stellarlist/features/registration/view/pages/animations/slide_and_fade_animation.dart';
import 'package:stellarlist/features/registration/view/provider/registration_provider.dart';
import 'package:stellarlist/features/registration/view/provider/state_model/registration_state_model.dart';
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
  late ProviderSubscription<RegistrationStateModel?> _providerSubscription;

  @override
  void initState() {
    super.initState();
    _providerSubscription =
        ref.listenManual<RegistrationStateModel?>(registrationProviderProvider, (prev, next) {
      if (next?.user != null && context.mounted) {
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
    debugPrint("dsata: ${registerWatch?.letsGetStartedState}");
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
                      child: SlideFadeTransition(
                        finalSlideOffset: const Offset(0, 100),
                        animationDuration: const Duration(milliseconds: 200),
                        shouldAnimate: registerWatch?.letsGetStartedState !=
                            LetsGetStartedState.showRegistrationButtons,
                        child: const LetsGetStartedRegistrationWidget(),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      top: 0,
                      left: 0,
                      right: 0,
                      child: SlideFadeTransition(
                        shouldAnimate: registerWatch?.letsGetStartedState ==
                            LetsGetStartedState.showEmailRegistration,
                        initialSlideOffset: const Offset(0, 100),
                        finalSlideOffset: Offset.zero,
                        isInitiallyVisible: false,
                        hideOnStartAnimation: false,
                        hideOnEndAnimation: true,
                        initialOpacity: 0.0,
                        finalOpacity: 1.0,
                        animationDuration: const Duration(milliseconds: 200),
                        child: const EmailRegistrationWidget(),
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
