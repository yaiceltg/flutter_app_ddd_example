import 'package:app/src/application/notes/note_form_bloc/note_form_bloc.dart';
import 'package:app/src/application/notes/note_list_bloc/note_list_bloc.dart';
import 'package:app/src/injection.dart';
import 'package:app/src/presentation/pages/notes/note_list/widget/note_card_widget.dart';
import 'package:app/src/presentation/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class NoteListPage extends StatelessWidget implements AutoRouteWrapper {
  const NoteListPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoteListBloc>(
          create: (context) => getIt<NoteListBloc>()
            ..add(
              const NoteListEvent.fetchNote(),
            ),
        ),
        BlocProvider<NoteFormBloc>(
          create: (context) => getIt<NoteFormBloc>(),
        )
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<NoteListBloc, NoteListState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              loaded: (_) {},
              failure: (_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      _.maybeMap(
                        orElse: () => 'Error',
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Note List Page',
          ),
        ),
        body: BlocBuilder<NoteListBloc, NoteListState>(
          builder: (context, state) {
            return state.map(
              initial: (_) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              loading: (_) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              loaded: (_) {
                if (_.notes.isEmpty()) {
                  return const Center(
                    child: Text('List is empty'),
                  );
                }

                return GridView.count(
                  crossAxisCount: 2,
                  children: _.notes
                      .asList()
                      .map(
                        (note) => NoteCardWidget(
                          note: note,
                        ),
                      )
                      .toList(),
                );
              },
              failure: (_) {
                return const Center(
                  child: Text('Error'),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AutoRouter.of(context).push(
              NoteFormRoute(
                note: null,
              ),
            );
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
