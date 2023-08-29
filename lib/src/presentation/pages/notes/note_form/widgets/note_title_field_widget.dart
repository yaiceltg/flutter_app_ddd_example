import 'package:app/src/application/notes/note_form_bloc/note_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NoteTitleField extends HookWidget {
  const NoteTitleField({super.key});

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();

    return BlocConsumer<NoteFormBloc, NoteFormState>(
      listenWhen: (p, c) => p.isEditing != c.isEditing,
      listener: (context, state) {
        // In case of an initial data failure... We can't get to this point though.
        textEditingController.text = state.note.title.getOrCrash();
      },
      buildWhen: (p, c) => p.note.title != c.note.title,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Short title',
              labelText: 'Title',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.redAccent,
                ),
              ),
            ),
            onChanged: (value) => context.read<NoteFormBloc>().add(
                  NoteFormEvent.titleChanged(value),
                ),
            validator: (value) => context
                .read<NoteFormBloc>()
                .state
                .note
                .title
                .value
                .fold(
                  (f) => f.maybeMap(
                    empty: (_) => 'Cannot be empty',
                    exceedingLength: (_) => 'Exceeding length, max: ${_.max}',
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
          ),
        );
      },
    );
  }
}
