import 'package:app/src/presentation/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Splash Page',
              ),
              ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).replaceNamed(
                    NoteListRoute.name,
                  );
                },
                child: const Text(
                  'Go to My Notes',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
