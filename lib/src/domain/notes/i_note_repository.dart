import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

import './note_failures.dart';
import './note.dart';

/// Interface for a repository that retrieves notes.
abstract class INoteRepository {
  ///
  /// Get notes list
  ///
  Future<Either<NoteFailure, KtList<Note>>> getNotes();

  ///
  /// Get note by id
  ///
  Future<Either<NoteFailure, Note>> getNote(String id);

  ///
  /// Add note
  ///
  Future<Either<NoteFailure, Unit>> addNote(Note note);

  ///
  /// Update note
  ///
  Future<Either<NoteFailure, Unit>> updateNote(Note note);

  ///
  /// Delete note
  ///
  Future<Either<NoteFailure, Unit>> deleteNote(String id);
}
