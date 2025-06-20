import 'package:dartz/dartz.dart';

class InvalidInputFailure {}

class InputConverter {
  Either<InvalidInputFailure, int> stringToUnsignedInteger(String str) {
    try {
      final value = int.parse(str);
      if (value < 0) throw const FormatException();
      return Right(value);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
} 