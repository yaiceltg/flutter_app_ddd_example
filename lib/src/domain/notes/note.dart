import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import './value_objects.dart';
import '../core/core.dart';

part 'note.freezed.dart';

@freezed
class Note with _$Note {
  const Note._();
  const factory Note({
    required UniqueId id,
    required NoteName title,
    String? description,
  }) = _Note;

  factory Note.empty() => Note(
        id: UniqueId(),
        title: NoteName(''),
        description: '',
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return title.failureOrUnit.fold(
      (f) => some(f),
      (_) => none(),
    );
  }
}
