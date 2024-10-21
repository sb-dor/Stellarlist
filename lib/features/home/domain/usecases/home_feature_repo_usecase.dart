import 'package:flutter/foundation.dart';
import 'package:stellarlist/core/domain/entities/favorite.dart';
import 'package:stellarlist/core/injections/injections.dart';
import 'package:stellarlist/features/home/domain/repo/home_feature_repo.dart';

@immutable
class HomeFeatureRepoUseCase {
  final HomeFeatureRepo _featureRepo = getIt<HomeFeatureRepo>();

  Future<void> addFavorite(Favorite favorite) => _featureRepo.addFavorite(favorite);

  Future<void> updateFavorite(Favorite favorite) => _featureRepo.updateFavorite(favorite);
}
