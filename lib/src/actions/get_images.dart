class GetImages {
  const GetImages(this.result, this.page);

  final void Function(dynamic action) result;
  final void Function(dynamic action) page;
}

class GetImagesSuccessful {
  const GetImagesSuccessful(this.images);

  final List<String> images;
}

class GetImagesError {
  const GetImagesError(this.error);

  final Object error;
}
