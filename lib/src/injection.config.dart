// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/core/app_bloc/app_bloc.dart' as _i3;
import 'application/notes/note_form_bloc/note_form_bloc.dart' as _i6;
import 'application/notes/note_list_bloc/note_list_bloc.dart' as _i7;
import 'domain/notes/notes.dart' as _i4;
import 'infrastructure/notes/note_local_repository.dart' as _i5;

const String _dev = 'dev';

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AppBloc>(() => _i3.AppBloc());
  gh.lazySingleton<_i4.INoteRepository>(
    () => _i5.NoteLocalRepository(),
    registerFor: {_dev},
  );
  gh.factory<_i6.NoteFormBloc>(
      () => _i6.NoteFormBloc(gh<_i4.INoteRepository>()));
  gh.factory<_i7.NoteListBloc>(
      () => _i7.NoteListBloc(gh<_i4.INoteRepository>()));
  return getIt;
}
