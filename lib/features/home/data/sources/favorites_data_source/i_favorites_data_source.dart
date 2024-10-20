import 'package:stellarlist/core/domain/entities/favorite.dart';

abstract class IFavoritesDataSource {
  Future<void> addFavorite(Favorite favorite);
}
