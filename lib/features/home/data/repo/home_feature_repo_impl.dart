import 'package:firebase_auth/firebase_auth.dart';
import 'package:stellarlist/core/domain/entities/favorite.dart';
import 'package:stellarlist/features/home/data/sources/favorites_data_source/favorites_firebase_data_source.dart';
import 'package:stellarlist/features/home/data/sources/favorites_data_source/i_favorites_data_source.dart';
import 'package:stellarlist/features/home/domain/repo/home_feature_repo.dart';

class HomeFeatureRepoImpl implements HomeFeatureRepo {
  //

  final IFavoritesDataSource _iFavoritesDataSource;

  HomeFeatureRepoImpl(
    this._iFavoritesDataSource,
  );

  @override
  Future<void> addFavorite(Favorite favorite) => _iFavoritesDataSource.addFavorite(favorite);

  @override
  Stream<List<Favorite>> favorites(User? user) => _iFavoritesDataSource
      .favorites(user)
      .map((favoriteList) => favoriteList.map((fav) => fav as Favorite).toList());

  @override
  Future<void> updateFavorite(Favorite favorite) => _iFavoritesDataSource.updateFavorite(favorite);
}
