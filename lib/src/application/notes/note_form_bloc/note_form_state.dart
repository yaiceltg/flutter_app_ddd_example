part of 'note_form_bloc.dart';

@freezed
class NoteFormState with _$NoteFormState {
  const NoteFormState._();

  const factory NoteFormState({
    required Note note,
    required bool showErrorMessages,
    required bool isEditing,
    required bool isSaving,
    required Option<Either<NoteFailure, Unit>> saveFailureOrSuccessOption,
  }) = _NoteFormState;

  factory NoteFormState.empty() => NoteFormState(
        note: Note.empty(),
        showErrorMessages: false,
        isEditing: false,
        isSaving: false,
        saveFailureOrSuccessOption: none(),
      );
}
