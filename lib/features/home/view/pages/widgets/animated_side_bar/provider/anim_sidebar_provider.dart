import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stellarlist/features/home/view/pages/widgets/animated_side_bar/provider/state_model/anim_sidebar_state_model.dart';

part 'anim_sidebar_provider.g.dart';

@Riverpod(keepAlive: true)
class AnimatedSidebarProvider extends _$AnimatedSidebarProvider {
  @override
  AnimatedSidebarStateModel build() {
    return AnimatedSidebarStateModel();
  }
}
