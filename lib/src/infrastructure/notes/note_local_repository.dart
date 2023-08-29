import 'dart:async';

import 'package:app/src/domain/core/value_objects.dart';
import 'package:app/src/domain/notes/notes.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:kt_dart/src/collection/kt_list.dart';

@dev
@LazySingleton(as: INoteRepository)
class NoteLocalRepository implements INoteRepository {
  // HACK: This is a temporary implementation of note list
  final List<Note> notes = [
    Note(
      id: UniqueId(),
      title: NoteTitle('My first note'),
      description: NoteBody('This is my first note'),
      color: NoteColor(NoteColor.predefinedColors.first),
    ),
  ];
  final StreamController _streamController = StreamController<List<Note>>();

  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchNotes() {
    final StreamController<Either<NoteFailure, KtList<Note>>> notesCtrl =
        StreamController();

    _streamController.stream.listen(
      (response) {
        notesCtrl.add(
          right(
            KtList.from(
              notes,
            ),
          ),
        );
      },
      onError: (error) {
        // controller.add(left(const PlayFailure.unknown()));
      },
    );

    _streamController.onCancel = () {
      notesCtrl.close();
    };

    _streamController.onListen = () {
      print('SUBSCRIBED');
    };

    return notesCtrl.stream;
  }

  @override
  Future<Either<NoteFailure, Unit>> addNote(Note note) async {
    try {
      // add note to list
      notes.add(note);

      // add note to stream
      _streamController.add(notes);

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
  Future<Either<NoteFailure, Unit>> deleteNote(Note id) async {
    try {
      // Find note by id, in case of not found, return NoteFailure.notFound()
      final index = notes.indexWhere(
        (note) => note.id.getOrCrash() == id.id.getOrCrash(),
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
        (n) => n.id.getOrCrash() == note.id.getOrCrash(),
      );

      if (index == -1) {
        return left(
          const NoteFailure.notFound(),
        );
      }
      notes[index] = note;

      _streamController.add(notes);

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
