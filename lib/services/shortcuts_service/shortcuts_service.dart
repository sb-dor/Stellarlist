import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@immutable
class IntentActionHelper extends Intent {
  const IntentActionHelper();
}

abstract class ShortcutsI {
  Map<ShortcutActivator, Intent>? shortCuts;

  Map<Type, Action<Intent>>? actions;
}

class EnterShortCut implements ShortcutsI {
  final VoidCallback onInvoke;

  EnterShortCut({required this.onInvoke}) {
    //
    //
    actions = {
      IntentActionHelper: CallbackAction<Intent>(
        onInvoke: (Intent intent) => onInvoke(),
      ),
    };
    shortCuts = {
      LogicalKeySet(LogicalKeyboardKey.enter): const IntentActionHelper(),
    };
  }

  @override
  Map<Type, Action<Intent>>? actions;

  @override
  Map<ShortcutActivator, Intent>? shortCuts;
}
