import 'package:app/src/domain/notes/notes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

part 'note_list_bloc.freezed.dart';
part 'note_list_event.dart';
part 'note_list_state.dart';

@injectable
class NoteListBloc extends Bloc<NoteListEvent, NoteListState> {
  final INoteRepository _noteRepository;

  NoteListBloc(
    this._noteRepository,
  ) : super(const NoteListState.initial()) {
    on<NoteListEvent>(handlerEvent);
  }

  Future handlerEvent(NoteListEvent event, Emitter<NoteListState> emitter) {
    return event.map(
      fetchNote: (_) async {
        Either<NoteFailure, KtList<Note>> failureOrNotes =
            await _noteRepository.getNotes();

        failureOrNotes.fold(
          (failure) {
            emitter(
              NoteListState.failure(failure),
            );
          },
          (notes) {
            emitter(
              NoteListState.loaded(notes),
            );
          },
        );

        return emitter.forEach(
          _noteRepository.watchNotes(),
          onData: (Either<NoteFailure, KtList<Note>> failureOrNotes) {
            //
            return failureOrNotes.fold(
              (f) {
                // no need to emit here, since we already have the notes
                return state;
              },
              (notes) {
                return NoteListState.loaded(notes);
              },
            );
          },
        );
      },
    );
  }
}
