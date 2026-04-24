import 'package:flutter_test/flutter_test.dart';
import 'package:pdam_fields/core/errors/failures.dart';

void main() {
  group('Failure', () {
    test('should create Failure with message', () {
      const failure = Failure('Something went wrong');
      expect(failure.message, 'Something went wrong');
      expect(failure.code, isNull);
    });

    test('should create Failure with message and code', () {
      const failure = Failure('Not found', code: '404');
      expect(failure.message, 'Not found');
      expect(failure.code, '404');
    });
  });

  group('ServerFailure', () {
    test('should create ServerFailure with default message', () {
      const failure = ServerFailure();
      expect(failure.message, 'Kesalahan server');
    });

    test('should create ServerFailure with custom message', () {
      const failure = ServerFailure('Internal server error');
      expect(failure.message, 'Internal server error');
    });

    test('should be a Failure', () {
      const failure = ServerFailure();
      expect(failure, isA<Failure>());
    });
  });

  group('CacheFailure', () {
    test('should create CacheFailure with default message', () {
      const failure = CacheFailure();
      expect(failure.message, 'Kesalahan cache lokal');
    });

    test('should create CacheFailure with custom message', () {
      const failure = CacheFailure('Disk full');
      expect(failure.message, 'Disk full');
    });

    test('should be a Failure', () {
      const failure = CacheFailure();
      expect(failure, isA<Failure>());
    });
  });

  group('NetworkFailure', () {
    test('should create NetworkFailure with default message', () {
      const failure = NetworkFailure();
      expect(failure.message, 'Tidak ada koneksi internet');
    });

    test('should create NetworkFailure with custom message', () {
      const failure = NetworkFailure('Connection timeout');
      expect(failure.message, 'Connection timeout');
    });

    test('should be a Failure', () {
      const failure = NetworkFailure();
      expect(failure, isA<Failure>());
    });
  });

  group('ValidationFailure', () {
    test('should create ValidationFailure with message only', () {
      const failure = ValidationFailure('Invalid input');
      expect(failure.message, 'Invalid input');
      expect(failure.fieldErrors, isNull);
    });

    test('should create ValidationFailure with field errors', () {
      const fieldErrors = {
        'email': 'Invalid email format',
        'password': 'Password too short',
      };
      const failure = ValidationFailure('Validation failed', fieldErrors: fieldErrors);
      expect(failure.message, 'Validation failed');
      expect(failure.fieldErrors, fieldErrors);
    });

    test('should be a Failure', () {
      const failure = ValidationFailure('Error');
      expect(failure, isA<Failure>());
    });

    test('should support empty fieldErrors', () {
      const failure = ValidationFailure('Error', fieldErrors: {});
      expect(failure.fieldErrors, {});
    });
  });

  group('Failure equality', () {
    test('same type and message should be equal', () {
      const failure1 = ServerFailure('Error');
      const failure2 = ServerFailure('Error');
      expect(failure1, failure2);
    });

    test('different messages should not be equal', () {
      const failure1 = ServerFailure('Error 1');
      const failure2 = ServerFailure('Error 2');
      expect(failure1, isNot(failure2));
    });

    test('different types should not be equal', () {
      const failure1 = ServerFailure('Error');
      const failure2 = CacheFailure('Error');
      expect(failure1, isNot(failure2));
    });
  });
}
