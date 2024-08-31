import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stellarlist/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (defaultTargetPlatform != TargetPlatform.linux) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  runApp(const _StellarListApp());
}

class _StellarListApp extends StatelessWidget {
  const _StellarListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: kDebugMode,
      home: _StellarListLaunch(),
    );
  }
}

class _StellarListLaunch extends StatefulWidget {
  const _StellarListLaunch({super.key});

  @override
  State<_StellarListLaunch> createState() => _StellarListLaunchState();
}

class _StellarListLaunchState extends State<_StellarListLaunch> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
