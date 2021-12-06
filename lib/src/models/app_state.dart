class AppState {
  AppState({
    this.images = const <String>[],
    this.isLoading = false,
    this.username = 'hans_isaacson',
    this.page = 1,
    this.avatar =
        'https://images.unsplash.com/profile-1612247405939-6cdf7a3cc024image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128',
    this.description = const <String>[],
  });
  final List<String> images;
  final bool isLoading;
  final String username;
  final int page;
  final String avatar;
  final List<String> description;

  AppState copyWith({
    final int? page,
    final List<String>? images,
    final bool? isLoading,
    final String? username,
    final String? avatar,
    final List<String>? description,
  }) {
    return AppState(
      page: page ?? this.page,
      images: images ?? this.images,
      isLoading: isLoading ?? this.isLoading,
      username: username ?? this.username,
      avatar: avatar ?? this.avatar,
      description: description ?? this.description,
    );
  }

  @override
  String toString() {
    return 'AppState(images: $images, isLoading: $isLoading, username: $username, page: $page, avatar: $avatar, description: $description)';
  }
}
