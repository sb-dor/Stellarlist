import 'package:auto_route/auto_route.dart';
import 'package:stellarlist/features/auth_check/view/page/auth_check_page.dart';
import 'package:stellarlist/services/auto_route_service/auto_route_service.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  // TODO: implement routes
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthCheckRoute.page,
          path: '/auth-check',
          initial: true,
        ),
        AutoRoute(
          page: RegistrationRoute.page,
          path: '/registration',
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
        ),
        // AutoRoute(
        //   page: ResponsiveFrameworkTestUi.page,
        //   path: '/test-responsive-ui',
        //   initial: true,
        // )
      ];
}
