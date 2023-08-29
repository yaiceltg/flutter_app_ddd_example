import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

@dev
@prod
@test
@injectable
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.initial()) {
    on<AppEvent>(handlerEvent);
  }

  Future handlerEvent(AppEvent event, Emitter<AppState> emitter) async {
    return event.map(
      started: (value) async {
        // TODO: search for the user's preferred config
        return null;
      },
    );
  }
}
