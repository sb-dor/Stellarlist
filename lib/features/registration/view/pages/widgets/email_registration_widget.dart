import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stellarlist/features/registration/domain/repo/registration_repo.dart';
import 'package:stellarlist/features/registration/view/provider/registration_provider.dart';
import 'package:stellarlist/features/registration/view/provider/state_model/registration_state_model.dart';
import 'package:stellarlist/injections/injections.dart';
import 'package:stellarlist/services/auth_services/auth_service.dart';

class EmailRegistrationWidget extends ConsumerStatefulWidget {
  const EmailRegistrationWidget({super.key});

  @override
  ConsumerState createState() => _EmailRegistrationWidgetState();
}

class _EmailRegistrationWidgetState extends ConsumerState<EmailRegistrationWidget> {
  bool _closeButton = false, _sendLinkHover = false;

  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

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
        const SizedBox(height: 30),
        Container(
          width: 320,
          height: 40,
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white.withOpacity(0.4),
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: TextField(
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                    cursorColor: Colors.white,
                    onSubmitted: (v) {
                      ref.read(registrationProviderProvider.notifier).emailLink(
                            getIt<RegistrationRepo>(),
                            authData: AuthData(
                              email: v.trim(),
                            ),
                          );
                      _sendLinkHover = true;
                      setState(() {});
                      Future.delayed(const Duration(seconds: 3), () {
                        _sendLinkHover = false;
                        if (context.mounted) setState(() {});
                      });
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.only(left: 10),
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Type your Email",
                      hintStyle: GoogleFonts.inter(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                top: 0,
                right: 0,
                child: MouseRegion(
                  onEnter: (v) => setState(() {
                    _sendLinkHover = true;
                  }),
                  onExit: (v) => setState(() {
                    _sendLinkHover = false;
                  }),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    margin: const EdgeInsets.only(top: 2, bottom: 2, right: 2),
                    width: 90,
                    decoration: BoxDecoration(
                      color: _sendLinkHover ? Colors.white : Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Send link",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          color: _sendLinkHover ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
