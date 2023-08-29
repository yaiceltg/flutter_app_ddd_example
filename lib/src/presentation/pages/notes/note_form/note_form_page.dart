import 'package:app/src/application/notes/note_form_bloc/note_form_bloc.dart';
import 'package:app/src/domain/notes/notes.dart';
import 'package:app/src/injection.dart';
import 'package:app/src/presentation/core/constants.dart';
import 'package:app/src/presentation/helpers/sackbar_helpers.dart';
import 'package:app/src/presentation/pages/notes/note_form/widgets/note_color_field_widget.dart';
import 'package:app/src/presentation/pages/notes/note_form/widgets/note_description_field_widget.dart';
import 'package:app/src/presentation/pages/notes/note_form/widgets/note_title_field_widget.dart';
import 'package:app/src/presentation/router/app_router.dart';
import 'package:app/src/presentation/shared/saving_in_progress_overlay/saving_in_progress_overlay.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class NoteFormPage extends StatelessWidget {
  final Note? note;

  const NoteFormPage({Key? key, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NoteFormBloc>(
      create: (ctx) => getIt<NoteFormBloc>()
        ..add(
          NoteFormEvent.initialized(
            optionOf(note),
          ),
        ),
      child: BlocConsumer<NoteFormBloc, NoteFormState>(
        listenWhen: (p, c) =>
            p.saveFailureOrSuccessOption != c.saveFailureOrSuccessOption,
        listener: (ctx, state) {
          state.saveFailureOrSuccessOption.fold(
            () {},
            (either) {
              either.fold(
                (l) {
                  SnackBarHelpers.showErrorSnackBar(
                    context: context,
                    message: l.maybeWhen(
                      unknown: () => 'Unknown error',
                      notFound: () => 'Note not found',
                      orElse: () => '',
                    ),
                  );
                },
                (r) {
                  // notify about success
                  SnackBarHelpers.showSuccessSnackBar(
                    context: context,
                    message: 'Note saved successfully',
                  );
                  context.router.popUntil(
                    (route) => route.settings.name == NoteListRoute.name,
                  );
                },
              );
            },
          );
        },
        buildWhen: (p, c) => p.isSaving != c.isSaving,
        builder: (context, state) => Stack(
          children: [
            const NoteFormScaffold(),
            SavingInProgressOverlay(isSaving: state.isSaving),
          ],
        ),
      ),
    );
  }
}

class NoteFormScaffold extends StatelessWidget {
  const NoteFormScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<NoteFormBloc, NoteFormState>(
          buildWhen: (p, c) => p.isEditing != c.isEditing,
          builder: (context, state) =>
              Text(state.isEditing ? 'Edit a note' : 'Create a note'),
        ),
        actions: <Widget>[
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.check),
                onPressed: () {
                  context.read<NoteFormBloc>().add(
                        const NoteFormEvent.saved(),
                      );
                },
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<NoteFormBloc, NoteFormState>(
        buildWhen: (p, c) => p.showErrorMessages != c.showErrorMessages,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              autovalidateMode: state.showErrorMessages
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: const CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: ColorField(),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: kFormFieldPadding,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: NoteTitleField(),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: kFormFieldPadding,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: NoteDescriptionField(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
