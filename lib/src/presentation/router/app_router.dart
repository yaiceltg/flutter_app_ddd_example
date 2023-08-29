import 'package:app/src/domain/notes/notes.dart';
import 'package:app/src/presentation/pages/get_started/get_started_page.dart';
import 'package:app/src/presentation/pages/notes/note_form/note_form_page.dart';
import 'package:app/src/presentation/pages/splash/splash_page.dart';
import 'package:app/src/presentation/pages/notes/note_list/note_list_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: '/get-started',
          page: GetStartedRoute.page,
        ),
        AutoRoute(
          path: '/notes',
          page: NoteListRoute.page,
        ),
        AutoRoute(
          path: '/notes/new',
          page: NoteFormRoute.page,
        ),
        // or it could be used with RedirectRoute
        RedirectRoute(
          path: '*',
          redirectTo: '/notes',
        ),
      ];
}
