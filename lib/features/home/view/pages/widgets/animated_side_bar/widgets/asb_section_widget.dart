import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stellarlist/core/widgets/editor_helper.dart';
import 'package:super_editor/super_editor.dart';

class AsbSectionWidget extends StatefulWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  final bool titleNameChange;

  const AsbSectionWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.titleNameChange = false,
  });

  @override
  State<AsbSectionWidget> createState() => _AsbSectionWidgetState();
}

class _AsbSectionWidgetState extends State<AsbSectionWidget> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (value) => setState(() {
        _hovered = true;
      }),
      onExit: (value) => setState(() {
        _hovered = false;
      }),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          color: _hovered ? Colors.grey.withOpacity(0.1) : null,
          height: 35,
          child: Row(
            children: [
              const SizedBox(width: 25),
              Icon(
                widget.icon,
                color: Colors.red,
                size: 15,
              ),
              const SizedBox(width: 10),
              if (widget.titleNameChange)
                Expanded(
                  child: EditorHelper(
                    title: widget.title,
                    onValueChanged: (String value) {
                      debugPrint("editing finished: $value");
                    },
                  ),
                )
              else
                Text(
                  widget.title,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}