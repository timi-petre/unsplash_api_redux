import 'package:freezed_annotation/freezed_annotation.dart';

import '/src/models/index.dart';

part 'get_images.freezed.dart';

@freezed
class GetImages with _$GetImages {
  const factory GetImages(void Function(dynamic action) result) = GetImagesStart;

  const factory GetImages.successful(List<Photo> images) = GetImagesSuccessful;

  const factory GetImages.error(Object error, StackTrace stackTrace) = GetImagesError;
}
