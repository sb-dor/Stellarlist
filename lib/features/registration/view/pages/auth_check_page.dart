import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stellarlist/features/registration/domain/repo/registration_repo.dart';
import 'package:stellarlist/features/registration/view/provider/registration_provider.dart';
import 'package:stellarlist/features/registration/view/provider/state_model/registration_state_model.dart';
import 'package:stellarlist/injections/injections.dart';
import 'package:stellarlist/services/auto_route_service/auto_route_service.gr.dart';

@RoutePage()
class AuthCheckPage extends ConsumerStatefulWidget {
  const AuthCheckPage({super.key});

  @override
  ConsumerState createState() => _AuthCheckPageState();
}

class _AuthCheckPageState extends ConsumerState<AuthCheckPage> {
  late ProviderSubscription<RegistrationStateModel?> _providerSubscription;

  @override
  void initState() {
    super.initState();
    ref.read(registrationProviderProvider.notifier).checkAuth(getIt<RegistrationRepo>());
    _providerSubscription =
        ref.listenManual<RegistrationStateModel?>(registrationProviderProvider, (prev, next) {
      if (next?.user != null && context.mounted) {
        AutoRouter.of(context).replaceAll([
          const HomeRoute(),
        ]);
      } else if (next?.user == null && context.mounted) {
        AutoRouter.of(context).replaceAll([
          const RegistrationRoute(),
        ]);
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
          children: const [
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
