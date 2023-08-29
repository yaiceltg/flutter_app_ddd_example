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
import 'application/notes/note_form_bloc/note_form_bloc.dart' as _i9;
import 'application/notes/note_list_bloc/note_list_bloc.dart' as _i10;
import 'domain/notes/i_note_repository.dart' as _i7;
import 'domain/notes/notes.dart' as _i5;
import 'infrastructure/core/firebase_injectable_module.dart' as _i11;
import 'infrastructure/core/firestore_helpers.dart' as _i4;
import 'infrastructure/notes/note_local_repository.dart' as _i6;
import 'infrastructure/notes/note_repository.dart' as _i8;

const String _dev = 'dev';
const String _prod = 'prod';
const String _test = 'test';

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
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.factory<_i3.AppBloc>(
    () => _i3.AppBloc(),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i4.FirebaseFirestore>(
      () => firebaseInjectableModule.firestore);
  gh.lazySingleton<_i5.INoteRepository>(
    () => _i6.NoteLocalRepository(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i7.INoteRepository>(
    () => _i8.NoteRepository(gh<_i4.FirebaseFirestore>()),
    registerFor: {_prod},
  );
  gh.factory<_i9.NoteFormBloc>(
    () => _i9.NoteFormBloc(gh<_i5.INoteRepository>()),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.factory<_i10.NoteListBloc>(
    () => _i10.NoteListBloc(gh<_i5.INoteRepository>()),
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  return getIt;
}

class _$FirebaseInjectableModule extends _i11.FirebaseInjectableModule {}
