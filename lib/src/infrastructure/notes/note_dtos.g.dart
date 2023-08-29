// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NoteDto _$$_NoteDtoFromJson(Map<String, dynamic> json) => _$_NoteDto(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String?,
      color: json['color'] as int,
    );

Map<String, dynamic> _$$_NoteDtoToJson(_$_NoteDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'color': instance.color,
    };
