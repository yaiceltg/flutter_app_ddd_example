part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const AppState._();

  const factory AppState({
    required String locale,
    required ThemeMode themeMode,
  }) = _AppState;

  factory AppState.initial() => const AppState(
        locale: 'es',
        themeMode: ThemeMode.system,
      );
}
