import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stellarlist/core/domain/entities/task.dart';
import 'package:stellarlist/core/utils/app_colors.dart';
import 'package:stellarlist/core/widgets/editor_helper.dart';
import 'package:stellarlist/core/widgets/icon_button_widget.dart';
import 'package:stellarlist/features/home/view/provider/home_provider/home_provider.dart';

import '../context_menu_region_widget.dart';

class TaskWidget extends ConsumerStatefulWidget {
  final Task? task;
  final int index;
  final int? textFiledMaxLines;
  final bool mainTask;

  const TaskWidget({
    super.key,
    required this.task,
    required this.index,
    this.textFiledMaxLines,
    this.mainTask = true,
  });

  @override
  ConsumerState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends ConsumerState<TaskWidget> {
  bool _hovered = false;

  void setVal(bool val) => setState(() {
        _hovered = val;
      });

  @override
  Widget build(BuildContext context) {
    return ContextMenuRegionWidget(
      contextMenuBuilder: (BuildContext context, Offset offset) {
        return AdaptiveTextSelectionToolbar.buttonItems(
          anchors: TextSelectionToolbarAnchors(
            primaryAnchor: offset,
          ),
          buttonItems: <ContextMenuButtonItem>[
            ContextMenuButtonItem(
              onPressed: () async {
                ContextMenuController.removeAny();
                await ref.read(homeProviderProvider.notifier).deleteTaskFromTaskList(
                      widget.task,
                    );
              },
              label: 'Delete',
              type: ContextMenuButtonType.delete,
            ),
          ],
        );
      },
      child: MouseRegion(
        onEnter: (val) => setVal(true),
        onExit: (val) => setVal(false),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          // color: Colors.amber,
          // height: 50,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_hovered)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ReorderableDragStartListener(
                        index: widget.index,
                        child: const MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Icon(
                            Icons.apps_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      IconButtonWidget(
                        icon: Icons.check_circle,
                        onTap: () {},
                        buttonPadding: EdgeInsets.zero,
                      ),
                    ],
                  )
                else
                  const SizedBox(width: 45),
                const SizedBox(width: 5),
                SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: Theme(
                    data: ThemeData(
                      unselectedWidgetColor: AppColors.mainAppColor,
                    ),
                    child: Checkbox(
                      value: widget.task?.isDone ?? false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      side: const BorderSide(color: Colors.grey),
                      activeColor: AppColors.mainAppColor,
                      onChanged: (bool? value) {
                        ref.read(homeProviderProvider.notifier).completeTask(
                              widget.task,
                            );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: EditorHelper(
                          title: widget.task?.title ?? '',
                          fontWeight: FontWeight.w500,
                          textFontSize: 16,
                          onValueChanged: (String value) {
                            // change the code in the future in it will be necessary
                            ref.read(homeProviderProvider.notifier).changeTaskNameOfTaskList(
                                  widget.task,
                                  value,
                                );
                          },
                          createOnEnter: (String value) {
                            ref.read(homeProviderProvider.notifier).addTaskInsideTaskList(
                                  widget.task,
                                  value,
                                );
                          },
                          textFiledMaxLines: widget.textFiledMaxLines,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          IconButton(
                            padding: const EdgeInsets.all(0),
                            constraints: const BoxConstraints(),
                            onPressed: () {},
                            icon: const Icon(Icons.date_range, size: 15),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            padding: const EdgeInsets.all(0),
                            constraints: const BoxConstraints(),
                            onPressed: () {},
                            icon: const Icon(Icons.label_important_outline, size: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (_hovered)
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.grey.shade800,
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          constraints: const BoxConstraints(),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.person,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.grey,
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            ref.read(homeProviderProvider.notifier).addTaskForSelectedTaskList(
                                  widget.task,
                                  mainTask: widget.mainTask,
                                );
                          },
                          icon: const Icon(
                            Icons.arrow_forward,
                            size: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.grey.shade800,
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.filter_list_rounded,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
