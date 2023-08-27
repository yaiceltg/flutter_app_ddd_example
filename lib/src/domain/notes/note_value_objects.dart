import 'package:dartz/dartz.dart';

import '../core/core.dart';

class NoteTitle extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory NoteTitle(String input) {
    return NoteTitle._(
      // add note name validation here, for now just return the input value
      validateStringNotEmpty(input.trim()),
    );
  }

  const NoteTitle._(this.value);
}

class NoteDescription extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory NoteDescription(String input) {
    return NoteDescription._(
      right(input.trim()),
    );
  }

  const NoteDescription._(this.value);
}
