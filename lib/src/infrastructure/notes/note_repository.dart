import 'package:app/src/domain/notes/i_note_repository.dart';
import 'package:app/src/domain/notes/note.dart';
import 'package:app/src/domain/notes/note_failures.dart';
import 'package:app/src/infrastructure/core/firestore_helpers.dart';
import 'package:app/src/infrastructure/notes/note_dtos.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

@prod
@LazySingleton(as: INoteRepository)
class NoteRepository implements INoteRepository {
  final FirebaseFirestore _firestore;

  NoteRepository(this._firestore);

  @override
  Future<Either<NoteFailure, Unit>> addNote(Note note) async {
    try {
      final noteDoc = await _firestore.userDocument();
      final noteDto = NoteDto.fromDomain(note);

      await noteDoc.notesCollection.doc(noteDto.id).set(noteDto.toJson());

      return right(unit);
    } on PlatformException catch (e) {
      // These error codes and messages aren't in the documentation AFAIK, experiment in the debugger to find out about them.
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermissions());
      } else {
        return left(const NoteFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> deleteNote(Note note) async {
    try {
      final noteDoc = await _firestore.userDocument();
      final noteDto = NoteDto.fromDomain(note);

      await noteDoc.notesCollection.doc(noteDto.id).delete();

      return right(unit);
    } on PlatformException catch (e) {
      // These error codes and messages aren't in the documentation AFAIK, experiment in the debugger to find out about them.
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermissions());
      } else if (e.message!.contains('NOT_FOUND')) {
        return left(const NoteFailure.notFound());
      } else {
        return left(const NoteFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<NoteFailure, Note>> getNote(String id) {
    // TODO: implement getNote
    throw UnimplementedError();
  }

  @override
  Future<Either<NoteFailure, KtList<Note>>> getNotes() {
    // TODO: implement getNotes
    throw UnimplementedError();
  }

  @override
  Future<Either<NoteFailure, Unit>> updateNote(Note note) async {
    try {
      final noteDoc = await _firestore.userDocument();
      final noteDto = NoteDto.fromDomain(note);

      await noteDoc.notesCollection.doc(noteDto.id).update(noteDto.toJson());

      return right(unit);
    } on PlatformException catch (e) {
      // These error codes and messages aren't in the documentation AFAIK, experiment in the debugger to find out about them.
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermissions());
      } else if (e.message!.contains('NOT_FOUND')) {
        return left(const NoteFailure.notFound());
      } else {
        return left(const NoteFailure.unexpected());
      }
    }
  }

  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchNotes() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc.notesCollection
        .snapshots()
        .map(
          (snapshot) => right<NoteFailure, KtList<Note>>(
            snapshot.docs
                .map((doc) => NoteDto.fromFirestore(doc).toDomain())
                .toImmutableList(),
          ),
        )
        .handleError((e) {
      if (e is PlatformException && e.message!.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermissions());
      } else {
        // TODO: Log these unexpected errors everywhere
        return left(const NoteFailure.unexpected());
      }
    });
  }
}
