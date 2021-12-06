class GetImages {
  const GetImages(this.result, this.username);

  final void Function(dynamic action) result;
  final void Function(dynamic action) username;
}

class GetImagesSuccessful {
  const GetImagesSuccessful(this.images);

  final List<String> images;
}

class GetImagesError {
  const GetImagesError(this.error);

  final Object error;
}
