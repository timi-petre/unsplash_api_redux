// GENERATED CODE - DO NOT MODIFY BY HAND

part of models;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Photo$ _$$Photo$FromJson(Map<String, dynamic> json) => _$Photo$(
      image: json['image'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$Photo$ToJson(_$Photo$ instance) => <String, dynamic>{
      'image': instance.image,
      'description': instance.description,
    };
