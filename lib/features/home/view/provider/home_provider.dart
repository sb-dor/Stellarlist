import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'state_model/home_state_model.dart';

part 'home_provider.g.dart';

@Riverpod(keepAlive: true)
class HomeProvider extends _$HomeProvider {
  //
  @override
  HomeStateModel build() {
    return HomeStateModel();
  }

//

  void changeStartedToScrollTask(bool startedToScrollTask) {
    state = state.clone(startedToScrollTask: startedToScrollTask);
  }
}
