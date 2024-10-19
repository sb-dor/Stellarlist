class HomeStateModel {
  bool startedToScrollTask;

  //

  HomeStateModel({this.startedToScrollTask = false});

  HomeStateModel clone({bool? startedToScrollTask}) {
    return HomeStateModel(
      startedToScrollTask: startedToScrollTask ?? this.startedToScrollTask,
    );
  }
}
