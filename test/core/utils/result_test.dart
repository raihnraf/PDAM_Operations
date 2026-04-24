import 'package:flutter_test/flutter_test.dart';
import 'package:pdam_fields/core/errors/failures.dart';
import 'package:pdam_fields/core/utils/result.dart';

void main() {
  group('Result', () {
    group('Success', () {
      test('should create Success with data', () {
        const result = Success<String>('test data');
        expect(result.data, 'test data');
      });

      test('should execute onSuccess callback in fold', () {
        const result = Success<int>(42);
        final value = result.fold(
          (failure) => -1,
          (data) => data * 2,
        );
        expect(value, 84);
      });

      test('should not execute onError callback in fold', () {
        const result = Success<String>('success');
        final value = result.fold(
          (failure) => 'error',
          (data) => data,
        );
        expect(value, 'success');
      });
    });

    group('FailureResult', () {
      test('should create FailureResult with failure', () {
        const failure = ServerFailure('Test error');
        const result = FailureResult<String>(failure);
        expect(result.failure, failure);
        expect(result.failure.message, 'Test error');
      });

      test('should execute onError callback in fold', () {
        const failure = CacheFailure('Cache miss');
        const result = FailureResult<int>(failure);
        final value = result.fold(
          (failure) => failure.message,
          (data) => 'success',
        );
        expect(value, 'Cache miss');
      });

      test('should not execute onSuccess callback in fold', () {
        const failure = NetworkFailure('No connection');
        const result = FailureResult<String>(failure);
        final value = result.fold(
          (failure) => 'error: ${failure.message}',
          (data) => 'should not happen',
        );
        expect(value, 'error: No connection');
      });
    });

    group('Result with different failure types', () {
      test('should handle ServerFailure', () {
        const failure = ServerFailure('500 Internal Server Error');
        const result = FailureResult<String>(failure);
        expect(result.failure, isA<ServerFailure>());
        expect(result.failure.message, '500 Internal Server Error');
      });

      test('should handle CacheFailure', () {
        const failure = CacheFailure('Disk full');
        const result = FailureResult<int>(failure);
        expect(result.failure, isA<CacheFailure>());
        expect(result.failure.message, 'Disk full');
      });

      test('should handle NetworkFailure', () {
        const failure = NetworkFailure();
        const result = FailureResult<bool>(failure);
        expect(result.failure, isA<NetworkFailure>());
        expect(result.failure.message, 'Tidak ada koneksi internet');
      });

      test('should handle ValidationFailure', () {
        const fieldErrors = {'email': 'Invalid email format'};
        const failure = ValidationFailure('Validation failed', fieldErrors: fieldErrors);
        const result = FailureResult<String>(failure);
        expect(result.failure, isA<ValidationFailure>());
        expect((result.failure as ValidationFailure).fieldErrors, fieldErrors);
      });
    });

    group('Result chaining', () {
      test('should chain results with fold', () {
        Result<int> parseNumber(String input) {
          final number = int.tryParse(input);
          if (number == null) {
            return const FailureResult(ServerFailure('Invalid number'));
          }
          return Success(number);
        }

        Result<int> doubleIt(int number) {
          return Success(number * 2);
        }

        final result = parseNumber('21').fold(
          (failure) => FailureResult<int>(failure),
          (number) => doubleIt(number),
        );

        expect(result, isA<Success<int>>());
        expect((result as Success<int>).data, 42);
      });
    });
  });
}
