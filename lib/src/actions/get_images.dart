class GetImages {
  const GetImages(this.result);

  final void Function(dynamic action) result;
}

class GetImagesSuccessful {
  const GetImagesSuccessful(this.images);

  final List<String> images;
}

class GetImagesError {
  const GetImagesError(this.error);

  final Object error;
}
