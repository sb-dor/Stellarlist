import 'dart:async';

import 'package:flutter/material.dart';

class EditorHelper extends StatefulWidget {
  final String title;
  final ValueChanged<String> onValueChanged;
  final String? hintText;

  const EditorHelper({
    super.key,
    required this.title,
    required this.onValueChanged,
    this.hintText,
  });

  @override
  State<EditorHelper> createState() => _EditorHelperState();
}

class _EditorHelperState extends State<EditorHelper> {
  final TextEditingController _textEditingController = TextEditingController();
  Timer? _timerForFinishingEdit;

  @override
  void initState() {
    _textEditingController.text = widget.title;
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _timerForFinishingEdit?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      onChanged: (value) {
        if ((_timerForFinishingEdit?.isActive ?? false)) {
          _timerForFinishingEdit?.cancel();
        }
        _timerForFinishingEdit = Timer(
          const Duration(milliseconds: 500),
          () {
            widget.onValueChanged(value.trim());
          },
        );
      },
      onTapOutside: (v) => FocusManager.instance.primaryFocus?.unfocus(),
      style: const TextStyle(color: Colors.white),
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
    );
  }
}
