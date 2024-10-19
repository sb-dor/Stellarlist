import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AsbMainSectionsWidget extends StatelessWidget {
  const AsbMainSectionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _AppBarMainSection(
          icon: Icons.inbox_outlined,
          title: "Inbox",
          onTap: () {},
        ),
        _AppBarMainSection(
          icon: Icons.calendar_month,
          title: "Today",
          onTap: () {},
        ),
        _AppBarMainSection(
          icon: Icons.task_alt,
          title: "Task",
          onTap: () {},
        ),
        _AppBarMainSection(
          icon: Icons.notifications,
          title: "Updates",
          onTap: () {},
        ),
        _AppBarMainSection(
          icon: Icons.list,
          title: "List",
          onTap: () {},
        ),
      ],
    );
  }
}

class _AppBarMainSection extends StatefulWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _AppBarMainSection({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  State<_AppBarMainSection> createState() => _AppBarMainSectionState();
}

class _AppBarMainSectionState extends State<_AppBarMainSection> {
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
