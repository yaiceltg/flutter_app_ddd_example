import 'package:cloud_firestore/cloud_firestore.dart';
export 'package:cloud_firestore/cloud_firestore.dart';

extension FirestoreX on FirebaseFirestore {
  /// The user must be already authenticated when calling this method.
  /// Otherwise, throws [NotAuthenticatedError].
  Future<DocumentReference> userDocument() async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc('hardcoded_user_id');
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get notesCollection => collection('notes');
}
