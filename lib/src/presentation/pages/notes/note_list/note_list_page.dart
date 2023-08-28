import 'package:app/src/application/notes/note_list_bloc/note_list_bloc.dart';
import 'package:app/src/injection.dart';
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
          create: (context) => getIt<NoteListBloc>(),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<NoteListBloc, NoteListState>(
          listener: (context, state) {},
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Note List Page',
          ),
        ),
        body: const Center(
          child: Text(
            'Note List Page',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AutoRouter.of(context).push(
              const NoteFormRoute(),
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
