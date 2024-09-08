import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class AnEmailOnTheWayScreen extends ConsumerStatefulWidget {
  const AnEmailOnTheWayScreen({super.key});

  @override
  ConsumerState createState() => _AnEmailOnTheWayScreenState();
}

class _AnEmailOnTheWayScreenState extends ConsumerState<AnEmailOnTheWayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "An email is on the way!",
              style: GoogleFonts.inter(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
