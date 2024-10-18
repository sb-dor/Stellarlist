import 'package:flutter/foundation.dart';
import 'package:stellarlist/features/home/domain/repo/home_feature_repo.dart';

@immutable
class HomeFeatureRepoUseCase {
  final HomeFeatureRepo _featureRepo;

  const HomeFeatureRepoUseCase(this._featureRepo);
}
