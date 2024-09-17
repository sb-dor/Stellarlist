import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:stellarlist/features/registration/domain/repo/registration_repo.dart';
import 'package:stellarlist/features/registration/view/provider/registration_provider.dart';
import 'package:stellarlist/injections/injections.dart';
import 'package:stellarlist/services/auto_route_service/auto_route_service.gr.dart';

class AutoRouteGuardHelper extends AutoRouteGuard {
  final WidgetRef ref;

  AutoRouteGuardHelper(this.ref);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // final context = router.navigatorKey.currentContext; // currenct context;

    var registrationModel = ref.watch(registrationProviderProvider);

    debugPrint("checking here for auth guard: ${registrationModel?.user}");
    if (registrationModel?.user != null) {
      resolver.next(true);
    } else {
      await ref.read(registrationProviderProvider.notifier).checkAuth(
            getIt<RegistrationRepo>(),
          );

      if (registrationModel?.user != null) {
        resolver.next(true);
      } else {
        resolver.redirect(
          const RegistrationRoute(),
        );
      }
    }
  }
}

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final WidgetRef ref;

  AppRouter(this.ref);

  @override
  // TODO: implement routes
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
          initial: true,
          guards: [AutoRouteGuardHelper(ref)],
        ),
        AutoRoute(
          page: RegistrationRoute.page,
          path: '/registration',
          guards: [AutoRouteGuardHelper(ref)],
        ),

        AutoRoute(
          page: AnEmailOnTheWayRoute.page,
          path: '/email-verification',
        ),
        // AutoRoute(
        //   page: ResponsiveFrameworkTestUi.page,
        //   path: '/test-responsive-ui',
        //   initial: true,
        // )
      ];
}
