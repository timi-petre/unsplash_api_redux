class AppState {
  AppState({
    this.images = const <String>[],
    this.isLoading = false,
    this.page = 1,
  });
  final List<String> images;
  final bool isLoading;
  final int page;

  AppState copyWith({
    final List<String>? images,
    final bool? isLoading,
    final int? page,
  }) {
    return AppState(
      images: images ?? this.images,
      isLoading: isLoading ?? this.isLoading,
      page: page ?? this.page,
    );
  }
}
