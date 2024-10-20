import 'package:stellarlist/core/injections/injections.dart';
import 'package:stellarlist/features/home/data/repo/home_feature_repo_impl.dart';
import 'package:stellarlist/features/home/data/sources/favorites_data_source/favorites_firebase_data_source.dart';
import 'package:stellarlist/features/home/data/sources/favorites_data_source/i_favorites_data_source.dart';
import 'package:stellarlist/features/home/domain/repo/home_feature_repo.dart';
import 'package:stellarlist/features/home/domain/usecases/home_feature_repo_usecase.dart';

abstract final class HomeInjections {
  static Future<void> inject() async {
    //
    final IFavoritesDataSource favoritesDataSource = FavoritesFirebaseDataSource();

    final homeFeatureRepoImpl = HomeFeatureRepoImpl(favoritesDataSource);

    getIt.registerLazySingleton<HomeFeatureRepo>(() => homeFeatureRepoImpl);

    getIt.registerLazySingleton<HomeFeatureRepoUseCase>(() => HomeFeatureRepoUseCase());
  }
}
