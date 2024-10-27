import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stellarlist/core/domain/entities/task_list.dart';
import 'package:stellarlist/core/utils/app_colors.dart';
import 'package:stellarlist/core/widgets/editor_helper.dart';
import 'package:stellarlist/features/home/view/provider/home_provider/home_provider.dart';

class TaskListWidget extends ConsumerStatefulWidget {
  final TaskList? taskList;

  const TaskListWidget({
    super.key,
    required this.taskList,
  });

  @override
  ConsumerState createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends ConsumerState<TaskListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  shape: const WidgetStatePropertyAll(
                    StadiumBorder(),
                  ),
                  padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  ),
                  elevation: const WidgetStatePropertyAll(0.0),
                  backgroundColor: WidgetStatePropertyAll(
                    AppColors.buttonBackgroundColor,
                  ),
                  overlayColor: const WidgetStatePropertyAll(
                    Colors.white,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Share",
                  style: GoogleFonts.inter(color: Colors.grey),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "This list is private",
                  style: GoogleFonts.inter(color: Colors.white),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.star_border_rounded),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                EditorHelper(
                  title: widget.taskList?.title ?? '',
                  onValueChanged: (value) {
                    final favorite = ref
                        .read(homeProviderProvider.notifier)
                        .findFavoriteByTaskList(widget.taskList);
                    if (favorite == null) return;
                    debugPrint("favorite issis: ${favorite}");
                    ref.read(homeProviderProvider.notifier).changeTaskListName(
                          favorite,
                          value,
                        );
                  },
                  textFontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
