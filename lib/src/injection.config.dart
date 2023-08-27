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

import 'application/notes/note_form_bloc/note_form_bloc.dart' as _i3;
import 'application/notes/note_list_bloc/note_list_bloc.dart' as _i5;
import 'domain/notes/notes.dart' as _i4;

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
  gh.factory<_i3.NoteFormBloc>(
      () => _i3.NoteFormBloc(gh<_i4.INoteRepository>()));
  gh.factory<_i5.NoteListBloc>(
      () => _i5.NoteListBloc(gh<_i4.INoteRepository>()));
  return getIt;
}
