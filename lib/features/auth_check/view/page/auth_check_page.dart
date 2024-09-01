import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stellarlist/services/auto_route_service/auto_route_service.gr.dart';

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
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        AutoRouter.of(context).push(const RegistrationRoute());
      }
    });
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
