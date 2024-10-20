import 'dart:developer';

import 'package:stellarlist/core/data/models/favorite_model/favorite_model.dart';
import 'package:stellarlist/core/domain/entities/favorite.dart';

import 'i_favorites_data_source.dart';

class FavoritesFirebaseDataSource implements IFavoritesDataSource {
  @override
  Future<void> addFavorite(Favorite favorite) async {
    final model = FavoriteModel.fromEntity(favorite);

    log("${model?.toJson()}");
  }
}
