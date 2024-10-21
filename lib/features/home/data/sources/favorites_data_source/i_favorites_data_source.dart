import 'package:firebase_auth/firebase_auth.dart';
import 'package:stellarlist/core/data/models/favorite_model/favorite_model.dart';
import 'package:stellarlist/core/domain/entities/favorite.dart';

abstract class IFavoritesDataSource {
  Future<void> addFavorite(Favorite favorite);

  Future<void> updateFavorite(Favorite favorite);

  Stream<List<FavoriteModel>> favorites(User? user);
}
