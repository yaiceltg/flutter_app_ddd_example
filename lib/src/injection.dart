import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import './injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies({
  String? env,
}) =>
    init(
      getIt,
      environment: env,
    );
