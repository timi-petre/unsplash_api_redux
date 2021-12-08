part of models;

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(<Photo>[]) List<Photo> images,
    @Default(false) bool isLoading,
    @Default('hans_isaacson') String username,
    @Default(1) int page,
    @Default('https://images.unsplash.com/profile-1612247405939-6cdf7a3cc024image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128')
        String avatar,
  }) = AppState$;
}
