import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import './note_value_objects.dart';
import '../core/core.dart';

part 'note.freezed.dart';

@freezed
class Note with _$Note {
  const Note._();
  const factory Note({
    required UniqueId id,
    required NoteTitle title,
    NoteDescription? description,
  }) = _Note;

  factory Note.empty() => Note(
        id: UniqueId(),
        title: NoteTitle(''),
        description: NoteDescription(''),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return title.failureOrUnit.fold(
      (f) => some(f),
      (_) => none(),
    );
  }
}
