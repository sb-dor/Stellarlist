import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stellarlist/services/auto_route_service/auto_route_service.gr.dart';

import 'route_guards/route_auth_guard.dart';
import 'route_guards/route_email_ver_guard.dart';

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
          guards: [RouteAuthGuard(ref)],
        ),
        AutoRoute(
          page: RegistrationRoute.page,
          path: '/registration',
          // guards: [AutoRouteGuardHelper(ref)],
        ),
        AutoRoute(
          page: AnEmailOnTheWayRoute.page,
          path: '/email-verification',
          guards: [RouteEmailVerificationGuard(ref)],
        ),
        // AutoRoute(
        //   page: ResponsiveFrameworkTestUi.page,
        //   path: '/test-responsive-ui',
        //   initial: true,
        // )
      ];
}
