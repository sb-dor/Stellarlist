import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

// more about responsive framework take a look this links:
// https://www.youtube.com/watch?v=MTaUeGmRQZY&t=253s
// https://pub.dev/packages/responsive_framework
@RoutePage()
class ResponsiveFrameworkTestUi extends StatefulWidget {
  const ResponsiveFrameworkTestUi({super.key});

  @override
  State<ResponsiveFrameworkTestUi> createState() => _ResponsiveFrameworkTestUiState();
}

class _ResponsiveFrameworkTestUiState extends State<ResponsiveFrameworkTestUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test of resposive framework ui"),
      ),
      body: BouncingScrollWrapper.builder(
        context,
        ListView(
          padding: ResponsiveValue<EdgeInsets>(
            context,
            conditionalValues: [
              const Condition.equals(
                name: TABLET,
                value: EdgeInsets.only(left: 20, right: 20),
              ),
              const Condition.equals(
                name: DESKTOP,
                value: EdgeInsets.only(left: 100, right: 100),
              ),
            ],
            defaultValue: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
          ).value,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "GridView with responsive value",
                style: TextStyle(
                  fontSize: ResponsiveValue<double>(
                    context,
                    conditionalValues: [
                      const Condition.equals(name: MOBILE, value: 16),
                      const Condition.equals(name: TABLET, value: 17),
                      const Condition.equals(name: DESKTOP, value: 19),
                      const Condition.largerThan(name: DESKTOP, value: 22),
                    ],
                    defaultValue: 16,
                  ).value,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // GridView.builder(
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisSpacing: 10,
            //     mainAxisSpacing: 10,
            //     crossAxisCount: ResponsiveValue<int>(
            //       context,
            //       conditionalValues: [
            //         const Condition.equals(name: MOBILE, value: 2),
            //         const Condition.equals(name: TABLET, value: 3),
            //         const Condition.equals(name: DESKTOP, value: 4),
            //         const Condition.largerThan(name: DESKTOP, value: 4),
            //       ],
            //       // remember to put default value
            //       // otherwise it will throw an error
            //       defaultValue: 2,
            //     ).value,
            //   ),
            //   itemCount: 8,
            //   itemBuilder: (context, index) {
            //     return Container(
            //       color: Colors.green,
            //     );
            //   },
            // ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "GridView with responsive value",
                style: TextStyle(
                  fontSize: ResponsiveValue<double>(
                    context,
                    conditionalValues: [
                      const Condition.equals(name: MOBILE, value: 16),
                      const Condition.equals(name: TABLET, value: 17),
                      const Condition.equals(name: DESKTOP, value: 19),
                      const Condition.largerThan(name: DESKTOP, value: 22),
                    ],
                    defaultValue: 16,
                  ).value,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ResponsiveRowColumn(
              layout: ResponsiveValue<ResponsiveRowColumnType>(
                context,
                conditionalValues: [
                  const Condition.largerThan(
                    name: MOBILE,
                    value: ResponsiveRowColumnType.ROW,
                  )
                ],
                defaultValue: ResponsiveRowColumnType.COLUMN,
              ).value,
              children: [
                ResponsiveRowColumnItem(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.pink,
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFit: FlexFit.tight,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: ResponsiveValue<int>(
                        context,
                        conditionalValues: [
                          const Condition.equals(name: MOBILE, value: 2),
                          const Condition.equals(name: TABLET, value: 3),
                          const Condition.equals(name: DESKTOP, value: 4),
                          const Condition.largerThan(name: DESKTOP, value: 4),
                        ],
                        // remember to put default value
                        // otherwise it will throw an error
                        defaultValue: 2,
                      ).value,
                    ),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.green,
                      );
                    },
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Resposive Scale box",
                style: TextStyle(
                  fontSize: ResponsiveValue<double>(
                    context,
                    conditionalValues: [
                      const Condition.equals(name: MOBILE, value: 16),
                      const Condition.equals(name: TABLET, value: 17),
                      const Condition.equals(name: DESKTOP, value: 19),
                      const Condition.largerThan(name: DESKTOP, value: 22),
                    ],
                    defaultValue: 16,
                  ).value,
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: ResponsiveScaledBox(
                width: ResponsiveValue<double>(
                  context,
                  conditionalValues: [
                    const Condition.equals(name: MOBILE, value: 450),
                    const Condition.largerThan(name: MOBILE, value: 400),
                  ],
                  defaultValue: 450,
                ).value,
                child: const Text(
                  "Anything inside scale box will be scaled",
                ),
              ),
            ),
          ],
        ), // drag with mouse lets us to drag screen with clicking on it (like in mobile)
        dragWithMouse: true,
      ),
    );
  }
}
