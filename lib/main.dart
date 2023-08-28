import 'package:app/src/app.dart';
import 'package:app/src/injection.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

void main() {
  ///
  /// Ensure that the WidgetsFlutterBinding is initialized before calling
  ///
  WidgetsFlutterBinding.ensureInitialized();

  ///
  /// Initialize the dependency injection container.
  ///
  configureDependencies(
    env: Environment.dev,
  );

  runApp(App());
}
