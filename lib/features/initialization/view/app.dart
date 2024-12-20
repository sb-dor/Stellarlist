import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stellarlist/core/injections/auto_router_injection/auto_router_injection.dart';
import 'package:stellarlist/core/injections/injections.dart';
import 'package:stellarlist/core/services/auto_route_service/auto_route_service.dart';
import 'package:stellarlist/core/services/auto_route_service/observers/route_observer.dart' as obs;

class StellarListApp extends ConsumerStatefulWidget {
  const StellarListApp({super.key});

  @override
  ConsumerState createState() => _StellarListAppState();
}

class _StellarListAppState extends ConsumerState<StellarListApp> {
  @override
  void initState() {
    super.initState();
    // AutoRouterInjections.inject(ref);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Stellarlist", // for web title on the top of section
      debugShowCheckedModeBanner: kDebugMode,
      builder: (context, child) {
        return ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 920, name: TABLET),
            const Breakpoint(start: 921, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: "4k"),
          ],
          breakpointsLandscape: [
            const Breakpoint(start: 0, end: 600, name: MOBILE),
            const Breakpoint(start: 601, end: 1024, name: TABLET),
            const Breakpoint(start: 1025, end: 2560, name: DESKTOP),
            const Breakpoint(start: 2561, end: double.infinity, name: "4k"),
          ],
        );
      },
      routerConfig: AppRouter(ref).config(
        navigatorObservers: () => [
          obs.RouteObserver(),
        ],
      ),
    );
  }
}
