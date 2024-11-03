import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stellarlist/core/utils/text_selection_controls.dart';

class EditorHelper extends StatefulWidget {
  final String title;
  final ValueChanged<String> onValueChanged;
  final ValueChanged<String>? createOnEnter;
  final String? hintText;
  final double? textFontSize;
  final FontWeight? fontWeight;
  final int textFiledMaxLines;

  const EditorHelper({
    super.key,
    required this.title,
    required this.onValueChanged,
    this.createOnEnter,
    this.textFontSize = 14,
    this.fontWeight,
    this.hintText,
    this.textFiledMaxLines = 3,
  });

  @override
  State<EditorHelper> createState() => _EditorHelperState();
}

class _EditorHelperState extends State<EditorHelper> {
  final TextEditingController _textEditingController = TextEditingController();
  Timer? _timerForFinishingEdit;

  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.title;
    debugPrint("setting title is: ${widget.title}");
  }

  @override
  void didUpdateWidget(covariant EditorHelper oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if the title has changed and update the controller's text if necessary
    if (oldWidget.title.trim() != widget.title.trim()) {
      final previousSelection = _textEditingController.selection;
      _textEditingController.text = "${widget.title} ";

      // Calculate a safe cursor position within the bounds of the new text
      int newOffset = previousSelection.baseOffset.clamp(
        0,
        _textEditingController.text.length,
      );
      _textEditingController.selection = TextSelection.collapsed(offset: newOffset);
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _timerForFinishingEdit?.cancel();
    debugPrint("is dispose working inside editor helper");
    super.dispose();
  }

  void _onEnd(String value) {
    if ((_timerForFinishingEdit?.isActive ?? false)) {
      _timerForFinishingEdit?.cancel();
    }
    _timerForFinishingEdit = Timer(
      const Duration(milliseconds: 250),
      () {
        widget.onValueChanged(value.trim());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      onChanged: (value) {
        _onEnd(value);
      },
      selectionControls: NoCopyTextSelectionControls(),
      autofocus: false,
      autocorrect: false,
      // enableInteractiveSelection: false,
      onSubmitted: (value) {
        if (widget.createOnEnter == null) return;
        // _onEnd(value);
        var cursorPos = _textEditingController.selection.base.offset;
        final length = _textEditingController.text.trim().length;
        if (cursorPos <= 0) return;
        if (cursorPos >= length) {
          widget.createOnEnter!('');
        } else {
          final text = _textEditingController.text.trim();
          widget.createOnEnter!(text.substring(cursorPos, length));
        }
      },
      onTapOutside: (v) => FocusManager.instance.primaryFocus?.unfocus(),
      style: GoogleFonts.inter(
        color: Colors.white,
        fontSize: widget.textFontSize,
        fontWeight: widget.fontWeight,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        isDense: true,
        hintStyle: const TextStyle(color: Colors.grey),
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        border: InputBorder.none,
        hintText: widget.hintText ?? "Edit Text",
      ),
      maxLines: widget.textFiledMaxLines,
      minLines: 1,
    );
  }
}
