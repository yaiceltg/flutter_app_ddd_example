import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

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

class NoteBody extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory NoteBody(String input) {
    return NoteBody._(
      right(input.trim()),
    );
  }

  const NoteBody._(this.value);
}

class NoteColor extends ValueObject<Color> {
  static const List<Color> predefinedColors = [
    Color(0xfffafafa), // canvas
    Color(0xfffa8072), // salmon
    Color(0xfffedc56), // mustard
    Color(0xffd0f0c0), // tea
    Color(0xfffca3b7), // flamingo
    Color(0xff997950), // tortilla
    Color(0xfffffdd0), // cream
  ];

  @override
  final Either<ValueFailure<Color>, Color> value;

  factory NoteColor(Color input) {
    return NoteColor._(
      right(makeColorOpaque(input)),
    );
  }

  const NoteColor._(this.value);
}
