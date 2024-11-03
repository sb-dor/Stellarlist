import 'package:flutter/material.dart';

class NoCopyTextSelectionControls extends MaterialTextSelectionControls {
  @override
  bool canCopy(TextSelectionDelegate delegate) => false;

  @override
  bool canCut(TextSelectionDelegate delegate) => false;

  @override
  bool canPaste(TextSelectionDelegate delegate) => false;

  @override
  bool canSelectAll(TextSelectionDelegate delegate) => false;
}
