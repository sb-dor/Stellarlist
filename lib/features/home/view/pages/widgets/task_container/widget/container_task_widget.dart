import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stellarlist/core/domain/entities/task.dart';
import 'package:stellarlist/core/utils/app_colors.dart';
import 'package:stellarlist/core/widgets/editor_helper.dart';
import 'package:stellarlist/core/widgets/icon_button_widget.dart';
import 'package:stellarlist/features/home/view/provider/home_provider/home_provider.dart';

class ContainerTaskWidget extends ConsumerStatefulWidget {
  final Task? task;

  const ContainerTaskWidget({
    super.key,
    required this.task,
  });

  @override
  ConsumerState createState() => _ContainerTaskWidgetState();
}

class _ContainerTaskWidgetState extends ConsumerState<ContainerTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 30, right: 25, left: 25),
          color: AppColors.containerColorAssent,
          child: Column(
            children: [
              Row(
                children: [
                  IconButtonWidget(
                    icon: Icons.close,
                    onTap: () {
                      ref.read(homeProviderProvider.notifier).removeTaskFromSelectedTaskList(
                            widget.task,
                          );
                    },
                  ),
                  const Expanded(
                    child: SizedBox.shrink(),
                  ),
                  Row(
                    children: [
                      IconButtonWidget(
                        icon: Icons.more_vert,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                    height: 40.0,
                    width: 40.0,
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Colors.red,
                      ),
                      child: Transform.scale(
                        scale: 1.4,
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
                  ),
                  const SizedBox(width: 10),
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
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: DottedBorder(
                      color: AppColors.iconButtonBackgroundHoverColor,
                      dashPattern: const [8, 4],
                      borderType: BorderType.Rect,
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.date_range,
                            color: AppColors.iconButtonBackgroundHoverColor,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Due date",
                            style: GoogleFonts.inter(
                              color: AppColors.iconButtonBackgroundHoverColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: DottedBorder(
                      color: AppColors.iconButtonBackgroundHoverColor,
                      dashPattern: const [8, 4],
                      borderType: BorderType.Rect,
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.person,
                            color: AppColors.iconButtonBackgroundHoverColor,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Assignee",
                            style: GoogleFonts.inter(
                              color: AppColors.iconButtonBackgroundHoverColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: DottedBorder(
                      color: AppColors.iconButtonBackgroundHoverColor,
                      dashPattern: const [8, 4],
                      borderType: BorderType.Rect,
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.label,
                            color: AppColors.iconButtonBackgroundHoverColor,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Label",
                            style: GoogleFonts.inter(
                              color: AppColors.iconButtonBackgroundHoverColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        )
      ],
    );
  }
}
