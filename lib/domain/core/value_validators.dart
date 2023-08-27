import 'package:dartz/dartz.dart';

import './failures.dart';

Either<ValueFailure<String>, String> validateMaxStringLength(
  String input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(ValueFailure.exceedingLength(
      failedValue: input,
      max: maxLength,
    ));
  }
}

Either<ValueFailure<String>, String> validateStringLength(
  String input,
  int length,
) {
  if (input.length == length) {
    return right(input);
  } else {
    return left(ValueFailure.mismatchLength(
      failedValue: input,
      length: length,
    ));
  }
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isEmpty) {
    return left(ValueFailure.empty(failedValue: input));
  } else {
    return right(input);
  }
}
