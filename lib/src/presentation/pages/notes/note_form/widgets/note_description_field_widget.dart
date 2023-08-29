import 'package:app/src/application/notes/note_form_bloc/note_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NoteDescriptionField extends HookWidget {
  const NoteDescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();

    return BlocConsumer<NoteFormBloc, NoteFormState>(
      listenWhen: (p, c) => p.isEditing != c.isEditing,
      listener: (context, state) {
        // In case of an initial data failure... We can't get to this point though.
        if (state.note.description != null) {
          textEditingController.text = state.note.description!.getOrElse('');
        }
      },
      buildWhen: (p, c) => p.note.description != c.note.description,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            controller: textEditingController,
            maxLines: 6,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Write your note content here',
              labelText: 'Description',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
            ),
            onChanged: (value) => context.read<NoteFormBloc>().add(
                  NoteFormEvent.descriptionChanged(value),
                ),
            validator: (value) => context
                .read<NoteFormBloc>()
                .state
                .note
                .description!
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
