import 'package:app/src/app_widget.dart';
import 'package:app/src/injection.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  ///
  /// Ensure that the WidgetsFlutterBinding is initialized before calling
  ///
  WidgetsFlutterBinding.ensureInitialized();

  ///
  /// Initialize the dependency injection container.
  ///
  configureDependencies(
    env: Environment.prod,
  );

  ///
  /// Initialize Firebase.
  ///
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(App());
}
