import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stellarlist/features/registration/domain/repo/registration_repo.dart';
import 'package:stellarlist/features/registration/view/provider/registration_provider.dart';
import 'package:stellarlist/injections/injections.dart';
import 'package:stellarlist/services/auto_route_service/auto_route_service.gr.dart';

class RouteAuthGuard extends AutoRouteGuard {
  final WidgetRef ref;

  RouteAuthGuard(this.ref);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // Get the current value of the user without watching for changes
    var user = ref.read(
      registrationProviderProvider.select(
        (user) => user?.user,
      ),
    );

    debugPrint("checking here for auth guard: $user");
    if (user != null) {
      resolver.next(true);
    } else {
      await ref.read(registrationProviderProvider.notifier).checkAuth(
            getIt<RegistrationRepo>(),
          );

      // Re-check the user value after authentication attempt
      user = ref.read(
        registrationProviderProvider.select(
          (user) => user?.user,
        ),
      );

      if (user != null) {
        resolver.next(true);
      } else {
        resolver.redirect(
          const RegistrationRoute(),
        );
      }
    }
  }
}
