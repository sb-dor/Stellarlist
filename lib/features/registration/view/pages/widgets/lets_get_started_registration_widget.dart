import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stellarlist/features/registration/domain/repo/registration_repo.dart';
import 'package:stellarlist/features/registration/view/provider/registration_provider.dart';
import 'package:stellarlist/features/registration/view/provider/state_model/registration_state_model.dart';
import 'package:stellarlist/injections/injections.dart';

class LetsGetStartedRegistrationWidget extends ConsumerStatefulWidget {
  const LetsGetStartedRegistrationWidget({super.key});

  @override
  ConsumerState createState() => _LetsGetStartedRegistrationWidgetState();
}

class _LetsGetStartedRegistrationWidgetState
    extends ConsumerState<LetsGetStartedRegistrationWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 100 / 2.85, right: 100 / 2.85),
          child: Text(
            "Let's get started",
            style: GoogleFonts.inter(
              fontSize: 40,
              color: Colors.white,
              height: 1,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 100 / 2.85, right: 100 / 2.85),
          child: Text(
            "Bring your personal email, connect your work later",
            style: GoogleFonts.inter(
              fontSize: 16,
              color: Colors.white54,
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: 250,
          child: ElevatedButton(
            onPressed: () async {
              await ref.read(registrationProviderProvider.notifier).googleAuth(
                    getIt<RegistrationRepo>(),
                  );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.black,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    "Continue with Google",
                    style: GoogleFonts.inter(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: 250,
          child: ElevatedButton(
            clipBehavior: Clip.none,
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.black,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    "Continue with Facebook",
                    style: GoogleFonts.inter(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: 250,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                Colors.white.withOpacity(0.4),
              ),
            ),
            onPressed: () {
              ref.read(registrationProviderProvider.notifier).changeStateToEmailRegistration(
                    LetsGetStartedState.showEmailRegistration,
                  );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.mail,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    "Continue with email",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}