import 'package:app/src/domain/notes/notes.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:kt_dart/src/collection/kt_list.dart';

@dev
@LazySingleton(as: INoteRepository)
class NoteLocalRepository implements INoteRepository {
  // HACK: This is a temporary implementation of note list
  final List<Note> notes = [];

  @override
  Future<Either<NoteFailure, Unit>> addNote(Note note) async {
    try {
      // add note to list
      notes.add(note);

      return right(
        unit,
      );
    } catch (_) {
      return left(
        const NoteFailure.unknown(),
      );
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> deleteNote(String id) async {
    try {
      // Find note by id, in case of not found, return NoteFailure.notFound()
      final index = notes.indexWhere(
        (note) => note.id.getOrCrash() == id,
      );

      if (index == -1) {
        return left(
          const NoteFailure.notFound(),
        );
      }

      // Remove note from list
      notes.removeAt(index);

      return right(
        unit,
      );
    } catch (_) {
      return left(
        const NoteFailure.unknown(),
      );
    }
  }

  @override
  Future<Either<NoteFailure, Note>> getNote(String id) async {
    try {
      // Find note by id, in case of not found, return NoteFailure.notFound()
      final index = notes.indexWhere(
        (note) => note.id.getOrCrash() == id,
      );

      if (index == -1) {
        return left(
          const NoteFailure.notFound(),
        );
      }

      return right(
        notes[index],
      );
    } catch (_) {
      return left(
        const NoteFailure.unknown(),
      );
    }
  }

  @override
  Future<Either<NoteFailure, KtList<Note>>> getNotes() async {
    try {
      return right(
        KtList.from(
          notes,
        ),
      );
    } catch (_) {
      return left(
        const NoteFailure.unknown(),
      );
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> updateNote(Note note) async {
    try {
      final index = notes.indexWhere(
        (note) => note.id.getOrCrash() == id,
      );

      if (index == -1) {
        return left(
          const NoteFailure.notFound(),
        );
      }
      notes[index] = note;

      return right(
        unit,
      );
    } catch (_) {
      return left(
        const NoteFailure.unknown(),
      );
    }
  }
}
