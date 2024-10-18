import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stellarlist/core/services/auto_route_service/auto_route_service.gr.dart';
import 'package:stellarlist/features/registration/view/provider/registration_provider.dart';

class RouteEmailVerificationGuard extends AutoRouteGuard {
  final WidgetRef ref;

  RouteEmailVerificationGuard(this.ref);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final sentEmail = ref.read(
      registrationProviderProvider.select((provider) => provider?.sentEmail),
    );

    if (sentEmail != null) {
      resolver.next();
    } else {
      // it will redirect to home widget
      // if user is not authenticated, it will redirect to registration page
      resolver.redirect(
        const HomeRoute(),
      );
    }
  }
}
