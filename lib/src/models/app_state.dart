class AppState {
  AppState({
    this.images = const <String>[],
    this.isLoading = false,
    this.username = 'hans_isaacson',
    this.page = 1,
    this.avatar = '',
  });
  final List<String> images;
  final bool isLoading;
  final String username;
  final int page;
  final String avatar;

  AppState copyWith({
    final int? page,
    final List<String>? images,
    final bool? isLoading,
    final String? username,
    final String? avatar,
  }) {
    return AppState(
      page: page ?? this.page,
      images: images ?? this.images,
      isLoading: isLoading ?? this.isLoading,
      username: username ?? this.username,
      avatar: avatar ?? this.avatar,
    );
  }
}
