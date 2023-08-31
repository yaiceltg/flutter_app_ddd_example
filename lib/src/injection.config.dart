// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_bloc/auth_bloc.dart' as _i17;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i16;
import 'application/core/app_bloc/app_bloc.dart' as _i3;
import 'application/notes/note_form_bloc/note_form_bloc.dart' as _i14;
import 'application/notes/note_list_bloc/note_list_bloc.dart' as _i15;
import 'domain/auth/i_auth_facade.dart' as _i8;
import 'domain/notes/i_note_repository.dart' as _i12;
import 'domain/notes/notes.dart' as _i10;
import 'infrastructure/auth/firebase_auth_facade.dart' as _i9;
import 'infrastructure/auth/firebase_user_mapper.dart' as _i6;
import 'infrastructure/core/firebase_injectable_module.dart' as _i18;
import 'infrastructure/core/firestore_helpers.dart' as _i5;
import 'infrastructure/notes/note_local_repository.dart' as _i11;
import 'infrastructure/notes/note_repository.dart' as _i13;

const String _dev = 'dev';
const String _prod = 'prod';

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
    },
  );
  gh.lazySingleton<_i4.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i5.FirebaseFirestore>(
      () => firebaseInjectableModule.firestore);
  gh.lazySingleton<_i6.FirebaseUserMapper>(() => _i6.FirebaseUserMapper());
  gh.lazySingleton<_i7.GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<_i8.IAuthFacade>(
    () => _i9.FirebaseAuthFacade(
      gh<_i4.FirebaseAuth>(),
      gh<_i7.GoogleSignIn>(),
      gh<_i6.FirebaseUserMapper>(),
    ),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i10.INoteRepository>(
    () => _i11.NoteLocalRepository(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i12.INoteRepository>(
    () => _i13.NoteRepository(gh<_i5.FirebaseFirestore>()),
    registerFor: {_prod},
  );
  gh.factory<_i14.NoteFormBloc>(
    () => _i14.NoteFormBloc(gh<_i10.INoteRepository>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i15.NoteListBloc>(
    () => _i15.NoteListBloc(gh<_i10.INoteRepository>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i16.SignInFormBloc>(
    () => _i16.SignInFormBloc(gh<_i8.IAuthFacade>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i17.AuthBloc>(
    () => _i17.AuthBloc(gh<_i8.IAuthFacade>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  return getIt;
}

class _$FirebaseInjectableModule extends _i18.FirebaseInjectableModule {}
