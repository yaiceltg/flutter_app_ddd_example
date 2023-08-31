import 'dart:async';

import 'package:app/src/domain/auth/i_auth_facade.dart';
import 'package:app/src/domain/auth/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

@dev
@prod
@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;

  AuthBloc(this._authFacade) : super(const AuthState.initial()) {
    on<AuthEvent>(handlerEvent);
  }

  Future handlerEvent(
    AuthEvent event,
    Emitter<AuthState> emitter,
  ) async {
    return event.map(
      authCheckRequested: (e) async {
        final userOption = await _authFacade.getSignedInUser();

        return emitter(
          userOption.fold(
            () => const AuthState.unauthenticated(),
            (user) => AuthState.authenticated(user),
          ),
        );
      },
      signedOut: (e) async {
        await _authFacade.signOut();

        return emitter(
          const AuthState.unauthenticated(),
        );
      },
    );
  }
}
