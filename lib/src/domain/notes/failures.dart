import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class NoteFailure with _$NoteFailure {
  const factory NoteFailure.http() = _Http;
  const factory NoteFailure.unknown() = _Unknown;
  const factory NoteFailure.notFound() = _NotFound;
}
