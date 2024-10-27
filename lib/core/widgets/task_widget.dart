import 'package:flutter/material.dart';
import 'package:stellarlist/core/domain/entities/task.dart';
import 'package:stellarlist/core/widgets/editor_helper.dart';

class TaskWidget extends StatelessWidget {
  final Task? task;

  const TaskWidget({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IntrinsicHeight(
        child: Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (bool? value) {},
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                EditorHelper(
                  title: task?.title ?? '',
                  fontWeight: FontWeight.w500,
                  textFontSize: 20,
                  onValueChanged: (String value) {
                    //
                  },
                ),
                SizedBox(height: 5),

              ],
            )
          ],
        ),
      ),
    );
  }
}
