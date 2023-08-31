import 'package:app/src/domain/auth/user.dart';
import 'package:app/src/domain/auth/value_objects.dart';
import 'package:app/src/domain/core/core.dart';
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseUserMapper {
  User toDomain(FirebaseAuth.User _) {
    return User(
      id: UniqueId.fromUniqueString(_.uid),
      name: StringSingleLine(_.displayName ?? _.email!.split('@').first),
      emailAddress: EmailAddress(_.email!),
    );
  }
}
