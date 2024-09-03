import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          onEnter: (v) => setState(() {
            _closeButton = true;
          }),
          onExit: (v) => setState(() {
            _closeButton = false;
          }),
          child: GestureDetector(
            onTap: () {
              ref.read(registrationProviderProvider.notifier).changeStateToEmailRegistration(
                    LetsGetStartedState.showRegistrationButtons,
                  );
            },
            child: Container(
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
      ],
    );
  }
}
