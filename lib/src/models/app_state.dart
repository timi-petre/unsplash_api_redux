class AppState {
  AppState({
    this.images = const <String>[],
    this.isLoading = false,
    this.username = '',
  });
  final List<String> images;
  final bool isLoading;
  final String username;

  AppState copyWith({
    final List<String>? images,
    final bool? isLoading,
    final String? username,
  }) {
    return AppState(
      images: images ?? this.images,
      isLoading: isLoading ?? this.isLoading,
      username: username ?? this.username,
    );
  }
}
