part of models;

@freezed
class Photo with _$Photo {
  factory Photo({
    required String image,
    String? description,
  }) = Photo$;

  factory Photo.fromJson(Map<dynamic, dynamic> json) => _$PhotoFromJson(Map<String, dynamic>.from(json));
}
