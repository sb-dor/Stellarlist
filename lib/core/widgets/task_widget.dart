import 'package:flutter/material.dart';
import 'package:stellarlist/core/domain/entities/task.dart';
import 'package:stellarlist/core/widgets/editor_helper.dart';

class TaskWidget extends StatefulWidget {
  final Task? task;

  const TaskWidget({
    super.key,
    required this.task,
  });

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool _hovered = false;

  void setVal(bool val) => setState(() {
        _hovered = val;
      });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (val) => setVal(true),
      onExit: (val) => setVal(false),
      child: Container(
        // color: Colors.amber,
        height: 50,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.apps_outlined,
                color: Colors.white,
              ),
              const SizedBox(width: 5),
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
                    side: BorderSide(color: Colors.grey),
                    onChanged: (bool? value) {},
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    EditorHelper(
                      title: widget.task?.title ?? '',
                      fontWeight: FontWeight.w500,
                      textFontSize: 16,
                      onValueChanged: (String value) {
                        //
                      },
                    ),
                    const SizedBox(height: 5),
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
                        padding: EdgeInsets.all(0),
                        constraints: BoxConstraints(),
                        onPressed: () {},
                        icon: Icon(
                          Icons.person,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.grey,
                      child: IconButton(
                        padding: EdgeInsets.all(0),
                        constraints: BoxConstraints(),
                        onPressed: () {},
                        icon: Icon(
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
                    padding: EdgeInsets.all(0),
                    constraints: BoxConstraints(),
                    onPressed: () {},
                    icon: Icon(
                      Icons.filter_list_rounded,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
