class AnimatedSidebarStateModel {
  bool? closed;

  AnimatedSidebarStateModel({this.closed = false});

  AnimatedSidebarStateModel clone({
    bool? closed,
  }) =>
      AnimatedSidebarStateModel(
        closed: closed ?? this.closed,
      );
}
