import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stellarlist/injections/injections.dart';
import 'package:stellarlist/services/auto_route_service/auto_route_service.dart';

abstract final class AutoRouterInjections {
  static void inject(WidgetRef ref) => getIt.registerLazySingleton<AppRouter>(
        () => AppRouter(ref),
      );
}
