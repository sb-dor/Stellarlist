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
    final model = FavoriteModel.fromEntity(favorite);

    DatabaseReference databaseReference = _firebaseRTDatabase.ref(
      // favorites/user_id
      "${FirebaseDatabaseReferences.favorites}${favorite.userId}",
    );

    await databaseReference.push().set(model?.toJson());
  }

  @override
  Stream<List<FavoriteModel>> favorites(User? user) async* {
    final DatabaseReference databaseReference = _firebaseRTDatabase.ref(
      "${FirebaseDatabaseReferences.favorites}/${user?.uid}",
    );

    yield* databaseReference.onValue.asyncMap(
          (DatabaseEvent event) {
        if (event.snapshot.value == null) return <FavoriteModel>[];

        // Cast the data to Map<dynamic, dynamic>
        final Map<dynamic, dynamic> rawData =
        event.snapshot.value as Map<dynamic, dynamic>;
        debugPrint("coming raw data: $rawData");

        // Convert to Map<String, Object?> safely
        return rawData.entries
            .map(
              (entry) {
            // Ensure that each entry.value is correctly cast as Map<String, Object?>
            final value = entry.value as Map<dynamic, dynamic>;
            final Map<String, Object?> favoriteData = value.map((key, value) =>
                MapEntry(key as String, value)); // Convert to Map<String, Object?>

            return FavoriteModel.fromJson(favoriteData);
          },
        )
            .toList();
      },
    );
  }
}
