import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class AuthCheckPage extends StatefulWidget {
  const AuthCheckPage({super.key});

  @override
  State<AuthCheckPage> createState() => _AuthCheckPageState();
}

class _AuthCheckPageState extends State<AuthCheckPage> {
  @override
  void initState() {
    super.initState();
    // check auth logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ResponsiveRowColumn(
          layout: ResponsiveBreakpoints.of(context).largerThan(MOBILE)
              ? ResponsiveRowColumnType.ROW
              : ResponsiveRowColumnType.COLUMN,
          rowMainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResponsiveRowColumnItem(
              child: Text("Text Size is"),
            ),
            ResponsiveRowColumnItem(
              child: Text("Text Size is"),
            ),
          ],
        ),
      ),
    );
  }
}
