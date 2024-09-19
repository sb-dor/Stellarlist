import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stellarlist/features/registration/view/provider/registration_provider.dart';
import 'package:stellarlist/firebase_options.dart';
import 'package:stellarlist/injections/auto_router_injection/auto_router_injection.dart';
import 'package:stellarlist/injections/injections.dart';
import 'package:url_strategy/url_strategy.dart';
import 'services/auto_route_service/auto_route_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injections.inject();

  if (defaultTargetPlatform != TargetPlatform.linux) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  if (kIsWeb) {
    setPathUrlStrategy();
  }

  runApp(const ProviderScope(child: _StellarListApp()));
}

class _StellarListApp extends ConsumerStatefulWidget {
  const _StellarListApp({super.key});

  @override
  ConsumerState createState() => __StellarListAppState();
}

class __StellarListAppState extends ConsumerState<_StellarListApp> {
  @override
  void initState() {
    super.initState();
    AutoRouterInjections.inject(ref);
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
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
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
      routerConfig: getIt<AppRouter>().config(),
    );
  }
}
