import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:stellarlist/features/registration/view/provider/registration_provider.dart';

@RoutePage()
class AnEmailOnTheWayScreen extends ConsumerStatefulWidget {
  const AnEmailOnTheWayScreen({super.key});

  @override
  ConsumerState createState() => _AnEmailOnTheWayScreenState();
}

class _AnEmailOnTheWayScreenState extends ConsumerState<AnEmailOnTheWayScreen> {
  bool _hoverToResendButton = false;

  @override
  Widget build(BuildContext context) {
    final registerWatch = ref.watch(registrationProviderProvider);
    return Scaffold(
      backgroundColor: HexColor('#181824'),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "An email is on the way!",
                    style: GoogleFonts.inter(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Column(
                    children: [
                      Text(
                        "A magic link was sent to:",
                        style: GoogleFonts.inter(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        registerWatch?.sentEmail ?? '',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 240,
                    child: Column(
                      children: [
                        Text(
                          "Can't find the email?",
                          style: GoogleFonts.inter(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        FocusableActionDetector(
                          onShowHoverHighlight: (hovered) {
                            if (hovered) {
                              setState(() {
                                _hoverToResendButton = true;
                              });
                            } else {
                              setState(() {
                                _hoverToResendButton = false;
                              });
                            }
                          },
                          mouseCursor: SystemMouseCursors.click,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            decoration: BoxDecoration(
                              color: _hoverToResendButton
                                  ? Colors.white.withOpacity(0.3)
                                  : Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RotationTransition(
                                  turns: const AlwaysStoppedAnimation(-30 / 360),
                                  child: Icon(
                                    Icons.link,
                                    color: _hoverToResendButton ? Colors.white : Colors.grey,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "Resend link",
                                  style: GoogleFonts.inter(
                                    color: _hoverToResendButton ? Colors.white : Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.1),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                CupertinoIcons.person,
                                color: Colors.grey,
                                size: 17,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "Use another account",
                                style: GoogleFonts.inter(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
