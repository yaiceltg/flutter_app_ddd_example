import 'package:app/src/domain/notes/failures.dart';
import 'package:app/src/domain/notes/i_note_repository.dart';
import 'package:app/src/domain/notes/note.dart';
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

  Future handlerEvent(NoteListEvent event, Emitter<NoteListState> emit) {
    return event.map(
      fetchNote: (_) async {
        Either<NoteFailure, KtList<Note>> failureOrNotes =
            await _noteRepository.getNotes();

        return failureOrNotes.fold(
          (failure) => emit(
            NoteListState.failure(failure),
          ),
          (notes) => emit(
            NoteListState.loaded(notes),
          ),
        );
      },
    );
  }
}
