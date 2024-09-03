// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:stellarlist/features/auth_check/view/page/auth_check_page.dart'
    as _i1;
import 'package:stellarlist/features/home/view/pages/home_page.dart' as _i2;
import 'package:stellarlist/features/registration/view/pages/registration_page.dart'
    as _i3;
import 'package:stellarlist/test_packages/responsive_framework_test_ui/responsive_framework_test_ui.dart'
    as _i4;

/// generated route for
/// [_i1.AuthCheckPage]
class AuthCheckRoute extends _i5.PageRouteInfo<void> {
  const AuthCheckRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AuthCheckRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthCheckRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthCheckPage();
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.RegistrationPage]
class RegistrationRoute extends _i5.PageRouteInfo<void> {
  const RegistrationRoute({List<_i5.PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.RegistrationPage();
    },
  );
}

/// generated route for
/// [_i4.ResponsiveFrameworkTestUi]
class ResponsiveFrameworkTestUi extends _i5.PageRouteInfo<void> {
  const ResponsiveFrameworkTestUi({List<_i5.PageRouteInfo>? children})
      : super(
          ResponsiveFrameworkTestUi.name,
          initialChildren: children,
        );

  static const String name = 'ResponsiveFrameworkTestUi';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.ResponsiveFrameworkTestUi();
    },
  );
}
