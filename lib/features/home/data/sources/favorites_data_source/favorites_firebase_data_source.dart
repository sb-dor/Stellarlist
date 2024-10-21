import 'dart:collection';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:stellarlist/core/data/models/favorite_model/favorite_model.dart';
import 'package:stellarlist/core/domain/entities/favorite.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:stellarlist/core/utils/firebase_database_references.dart';
import 'i_favorites_data_source.dart';

class FavoritesFirebaseDataSource implements IFavoritesDataSource {
  final _firebaseRTDatabase = FirebaseDatabase.instance;

  @override
  Future<void> addFavorite(Favorite favorite) async {

    // inside database it will create :
    // favorites :
    //      users_id ------- which will represent all users favorites
    //        favorite
    //        favorite
    //        favorite

    final model = FavoriteModel.fromEntity(favorite);

    DatabaseReference databaseReference = _firebaseRTDatabase.ref(
      // favorites/user_id
      "${FirebaseDatabaseReferences.favorites}${favorite.userId}",
    );

    // set your own Id for record
    await databaseReference.child(model!.id!).set(model.toJson());
  }

  @override
  Stream<List<FavoriteModel>> favorites(User? user) async* {
    final DatabaseReference databaseReference = _firebaseRTDatabase.ref(
      "${FirebaseDatabaseReferences.favorites}/${user?.uid}",
    );

    yield* databaseReference.onValue.asyncMap(
      (DatabaseEvent event) {
        if (event.snapshot.value == null) return <FavoriteModel>[];
        final Map<Object?, Object?> data =
            event.snapshot.value as Map<Object?, Object?>; // because runtime is this one
        return data.entries.map(
          (entry) {
            // Handle casting each entry.value to Map<String, dynamic>
            return FavoriteModel.fromFirebaseJson(
              entry.value as Map<Object?, Object?>,
            );
          },
        ).toList();
      },
    );
  }
}
