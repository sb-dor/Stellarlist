import 'dart:developer';

import 'package:stellarlist/core/data/models/favorite_model/favorite_model.dart';
import 'package:stellarlist/core/domain/entities/favorite.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:stellarlist/core/utils/firebase_database_references.dart';
import 'i_favorites_data_source.dart';

class FavoritesFirebaseDataSource implements IFavoritesDataSource {
  final _firebaseRTDatabase = FirebaseDatabase.instance;

  @override
  Future<void> addFavorite(Favorite favorite) async {
    final model = FavoriteModel.fromEntity(favorite);

    DatabaseReference databaseReference = _firebaseRTDatabase.ref(
      FirebaseDatabaseReferences.favorites,
    );

    await databaseReference.push().set(model?.toJson());
  }
}
