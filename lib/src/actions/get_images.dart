part of actions;

@freezed
class GetImages with _$GetImages implements AppAction {
  const factory GetImages(void Function(dynamic action) result) = GetImagesStart;

  const factory GetImages.successful(List<Photo> images) = GetImagesSuccessful;

  const factory GetImages.error(Object error, StackTrace stackTrace) = GetImagesError;
}
