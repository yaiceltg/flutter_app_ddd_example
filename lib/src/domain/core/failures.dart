import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) = ExceedingLength<T>;

  const factory ValueFailure.mismatchLength({
    required T failedValue,
    required int length,
  }) = MismatchLength<T>;

  const factory ValueFailure.empty({
    required T failedValue,
  }) = Empty<T>;
}
