import 'package:app/src/infrastructure/core/firestore_helpers.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseInjectableModule {
  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
}
