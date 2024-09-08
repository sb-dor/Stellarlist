import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stellarlist/features/registration/view/provider/registration_provider.dart';
import 'package:stellarlist/features/registration/view/provider/state_model/registration_state_model.dart';

class EmailRegistrationWidget extends ConsumerStatefulWidget {
  const EmailRegistrationWidget({super.key});

  @override
  ConsumerState createState() => _EmailRegistrationWidgetState();
}

class _EmailRegistrationWidgetState extends ConsumerState<EmailRegistrationWidget> {
  bool _closeButton = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (v) => setState(() {
            _closeButton = true;
          }),
          onExit: (v) => setState(() {
            _closeButton = false;
          }),
          child: GestureDetector(
            onTap: () {
              ref.read(registrationProviderProvider.notifier).changeStateInEmailRegistration(
                    LetsGetStartedState.showRegistrationButtons,
                  );
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: _closeButton ? Colors.white : Colors.grey,
                  ),
                  color: Colors.transparent),
              child: Icon(
                Icons.close,
                size: 20,
                color: _closeButton ? Colors.white : Colors.grey,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 100 / 2.85, right: 100 / 2.85),
          child: Text(
            "Enter your email address",
            style: GoogleFonts.inter(
              fontSize: 40,
              color: Colors.white,
              height: 1,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
