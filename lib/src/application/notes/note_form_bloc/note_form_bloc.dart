import 'package:app/src/domain/notes/notes.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

part 'note_form_bloc.freezed.dart';
part 'note_form_event.dart';
part 'note_form_state.dart';

@injectable
class NoteFormBloc extends Bloc<NoteFormEvent, NoteFormState> {
  final INoteRepository _noteRepository;

  NoteFormBloc(
    this._noteRepository,
  ) : super(NoteFormState.empty()) {
    on<NoteFormEvent>(handlerEvent);
  }

  Future handlerEvent(NoteFormEvent event, Emitter<NoteFormState> emitter) {
    return event.map(
      initialized: (value) async {
        return value.initialNoteOption.fold(() {
          return emitter(
            NoteFormState.empty(),
          );
        }, (initialNote) {
          return emitter(
            state.copyWith(
              note: initialNote,
              isEditing: true,
            ),
          );
        });
      },
      titleChanged: (e) async {
        return emitter(
          state.copyWith(
            note: state.note.copyWith(
              title: NoteTitle(e.titleStr),
            ),
          ),
        );
      },
      descriptionChanged: (e) async {
        return emitter(
          state.copyWith(
            note: state.note.copyWith(
              description: NoteDescription(e.descriptionStr),
            ),
          ),
        );
      },
      saved: (_) async {
        Either<NoteFailure, Unit>? failureOrSuccess;

        emitter(
          state.copyWith(
            isSaving: true,
            saveFailureOrSuccessOption: none(),
          ),
        );

        if (state.note.failureOption.isSome()) {
          failureOrSuccess = state.isEditing
              ? await _noteRepository.updateNote(state.note)
              : await _noteRepository.addNote(state.note);
        }

        return emitter(
          state.copyWith(
            isSaving: false,
            saveFailureOrSuccessOption: optionOf(failureOrSuccess),
          ),
        );
      },
    );
  }
}