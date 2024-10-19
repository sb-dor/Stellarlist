import 'package:flutter/material.dart';
import 'asb_section_widget.dart';

class AsbMainSectionsWidget extends StatelessWidget {
  const AsbMainSectionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AsbSectionWidget(
          icon: Icons.inbox_outlined,
          title: "Inbox",
          onTap: () {},
        ),
        AsbSectionWidget(
          icon: Icons.calendar_month,
          title: "Today",
          onTap: () {},
        ),
        AsbSectionWidget(
          icon: Icons.task_alt,
          title: "Task",
          onTap: () {},
        ),
        AsbSectionWidget(
          icon: Icons.notifications,
          title: "Updates",
          onTap: () {},
        ),
        AsbSectionWidget(
          icon: Icons.list,
          title: "List",
          onTap: () {},
        ),
      ],
    );
  }
}
