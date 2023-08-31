import 'package:app/src/domain/notes/notes.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'note_form_bloc.freezed.dart';
part 'note_form_event.dart';
part 'note_form_state.dart';

@dev
@prod
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
              description: NoteBody(e.descriptionStr),
            ),
          ),
        );
      },
      colorChanged: (_) async {
        return emitter(
          state.copyWith(
            note: state.note.copyWith(
              color: NoteColor(_.color),
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

        if (state.note.failureOption.isNone()) {
          // HACK: waith for 1 second to show the saving indicator
          await Future.delayed(
            const Duration(
              seconds: 1,
            ),
          );

          failureOrSuccess = state.isEditing
              ? await _noteRepository.updateNote(state.note)
              : await _noteRepository.addNote(state.note);
        }

        return emitter(
          state.copyWith(
            isSaving: false,
            showErrorMessages: true,
            saveFailureOrSuccessOption: optionOf(failureOrSuccess),
          ),
        );
      },
    );
  }
}
