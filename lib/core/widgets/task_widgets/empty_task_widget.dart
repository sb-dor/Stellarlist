import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stellarlist/core/widgets/context_menu_region_widget.dart';
import 'package:stellarlist/core/widgets/editor_helper.dart';


class EmptyTaskWidget extends ConsumerStatefulWidget {
  final VoidCallback onTap;

  const EmptyTaskWidget({
    super.key,
    required this.onTap,
  });

  @override
  ConsumerState createState() => _EmptyTaskWidgetState();
}

class _EmptyTaskWidgetState extends ConsumerState<EmptyTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return ContextMenuRegionWidget(
      contextMenuBuilder: (BuildContext context, Offset offset) {
        return AdaptiveTextSelectionToolbar.buttonItems(
          anchors: TextSelectionToolbarAnchors(
            primaryAnchor: offset,
          ),
          buttonItems: const <ContextMenuButtonItem>[
            // ContextMenuButtonItem(
            //   onPressed: () async {
            //     ContextMenuController.removeAny();
            //     // await ref.read(homeProviderProvider.notifier).deleteTaskFromTaskList(
            //     //       widget.task,
            //     //     );
            //   },
            //   label: 'Delete',
            //   type: ContextMenuButtonType.delete,
            // ),
          ],
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        // color: Colors.amber,
        height: 50,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.0,
                width: 24.0,
                child: Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Colors.red,
                  ),
                  child: Checkbox(
                    value: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    side: const BorderSide(color: Colors.grey),
                    onChanged: (bool? value) {},
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Flexible(
                      child: EditorHelper(
                        hintText: "Click here to add a task,"
                            " or type '/' to choose a different content type",
                        fontWeight: FontWeight.w500,
                        textFontSize: 16,
                        onTap: widget.onTap,
                        onValueChanged: (String value) {
                          // change the code in the future in it will be necessary
                          // ref.read(homeProviderProvider.notifier).changeTaskNameOfTaskList(
                          //       widget.task,
                          //       value,
                          //     );
                        },
                        createOnEnter: (String value) {
                          // ref.read(homeProviderProvider.notifier).addTaskInsideTaskList(
                          //       widget.task,
                          //       value,
                          //     );
                        },
                        textFiledMaxLines: 2,
                      ),
                    ),
                    const SizedBox(height: 5),
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
            ],
          ),
        ),
      ),
    );
  }
}
