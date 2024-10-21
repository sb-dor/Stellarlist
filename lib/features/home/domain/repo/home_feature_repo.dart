import 'package:firebase_auth/firebase_auth.dart';
import 'package:stellarlist/core/domain/entities/favorite.dart';

abstract interface class HomeFeatureRepo {
  Future<void> addFavorite(Favorite favorite);

  Future<void> updateFavorite(Favorite favorite);

  Stream<List<Favorite>> favorites(User? user);
}
