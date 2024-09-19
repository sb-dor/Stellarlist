class AnimatedSidebarStateModel {
  bool? closed;
  bool? stuck;
  bool? hovered;

  AnimatedSidebarStateModel({
    this.closed = false,
    this.stuck = true,
    this.hovered = false,
  });

  AnimatedSidebarStateModel clone({
    bool? closed,
    bool? stuck,
    bool? hovered,
  }) =>
      AnimatedSidebarStateModel(
        closed: closed ?? this.closed,
        stuck: stuck ?? this.stuck,
        hovered: hovered ?? this.hovered,
      );
}
