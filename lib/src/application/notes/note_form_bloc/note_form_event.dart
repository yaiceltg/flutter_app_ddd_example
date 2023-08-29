part of 'note_form_bloc.dart';

@freezed
class NoteFormEvent with _$NoteFormEvent {
  const factory NoteFormEvent.initialized(Option<Note> initialNoteOption) =
      _Initialized;
  const factory NoteFormEvent.titleChanged(String titleStr) = _TitleChanged;
  const factory NoteFormEvent.descriptionChanged(String descriptionStr) =
      _DescriptionChanged;
  const factory NoteFormEvent.colorChanged(Color color) = _ColorChanged;
  const factory NoteFormEvent.saved() = _Saved;
}
