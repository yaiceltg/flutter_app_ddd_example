import 'package:app/src/domain/core/core.dart';
import 'package:app/src/domain/notes/note.dart';
import 'package:app/src/domain/notes/note_value_objects.dart';
import 'package:app/src/infrastructure/core/firestore_helpers.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_dtos.freezed.dart';
part 'note_dtos.g.dart';

@freezed
class NoteDto with _$NoteDto {
  const NoteDto._();

  const factory NoteDto({
    required String id,
    required String title,
    String? body,
    required int color,
  }) = _NoteDto;

  factory NoteDto.fromDomain(Note note) {
    return NoteDto(
      id: note.id.getOrCrash(),
      title: note.title.getOrCrash(),
      body: note.description?.getOrCrash(),
      color: note.color.getOrCrash().value,
    );
  }

  Note toDomain() {
    return Note(
      id: UniqueId.fromUniqueString(id),
      title: NoteTitle(title),
      description: body != null ? NoteBody(body!) : null,
      color: NoteColor(Color(color)),
    );
  }

  factory NoteDto.fromJson(Map<String, dynamic> json) =>
      _$NoteDtoFromJson(json);

  factory NoteDto.fromFirestore(DocumentSnapshot doc) {
    return NoteDto.fromJson(doc.data() as Map<String, dynamic>).copyWith(
      id: doc.id,
    );
  }
}
