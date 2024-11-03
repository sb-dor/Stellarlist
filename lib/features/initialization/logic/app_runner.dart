import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stellarlist/core/injections/injections.dart';
import 'package:stellarlist/core/services/logger_service/logger_service.dart';
import 'package:stellarlist/features/initialization/view/app.dart';
import 'package:stellarlist/firebase_options.dart';
import 'package:url_strategy/url_strategy.dart';

final class AppRunner {
  const AppRunner();

  Future<void> initApp() async {
    final binding = WidgetsFlutterBinding.ensureInitialized();

    // Call this to perform asynchronous initialization work before the first frame
    // is rendered (which takes down the splash screen).
    // The framework will still do all the work to produce frames, but those frames are never sent
    // to the engine and will not appear on screen.
    // Calling this has no effect after the first frame has been sent to the engine
    binding.deferFirstFrame();

    Future<void> init() async {
      try {
        if (defaultTargetPlatform != TargetPlatform.linux) {
          await Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          );
        }

        if (kIsWeb) {
          // removes hash-tag from url
          setPathUrlStrategy();
          // On web, disable the browser's context menu since this example uses a custom
          // Flutter-rendered context menu.
          BrowserContextMenu.disableContextMenu();
        }

        await Injections.inject();

        runApp(
          const ProviderScope(
            child: StellarListApp(),
          ),
        );
      } catch (e, stackTrace) {
        logger.error(
          'Initialization failed',
          error: e,
          stackTrace: stackTrace,
        );
        // log error or even show init failed screen
      }
      // finally is try-catch's block, it will work anyway regardless of whether an exception was
      // thrown or caught, or even try completely finished
      finally {
        // Allow rendering
        binding.allowFirstFrame();
      }
    }

    await init();
  }
}
