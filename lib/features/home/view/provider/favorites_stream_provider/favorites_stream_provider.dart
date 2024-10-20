import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stellarlist/core/domain/entities/favorite.dart';
import 'package:stellarlist/core/injections/injections.dart';
import 'package:stellarlist/features/home/domain/repo/home_feature_repo.dart';
import 'package:stellarlist/features/registration/view/provider/registration_provider.dart';

part 'favorites_stream_provider.g.dart';

@Riverpod(keepAlive: true)
class FavoritesStreamProvider extends _$FavoritesStreamProvider {
  @override
  Stream<List<Favorite>> build() async* {
    yield* getIt<HomeFeatureRepo>().favorites(
      ref.watch(registrationProviderProvider)?.user,
    );
  }
}
