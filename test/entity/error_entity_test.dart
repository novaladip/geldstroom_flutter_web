import 'package:flutter_test/flutter_test.dart';
import 'package:geldstroom_web_flutter/entity/error_entity.dart';

void main() {
  group('ErrorEntity', () {
    test(
        'parse from json and should '
        'return true when comparing to the same object', () {
      final jsonPayload = {
        'message': 'something wrong',
        'errorCode': '666',
        'error': null,
      };
      final error1 = ErrorEntity.fromJSON(jsonPayload);
      final error2 = ErrorEntity.fromJSON(jsonPayload);

      expect(error1, error2);
    });

    test('factory networkError should always return the same value', () {
      final error1 = ErrorEntity.networkError();
      final error2 = ErrorEntity.networkError();

      expect(error1, error2);
    });

    test('factory unknownError should always return the same value', () {
      final error1 = ErrorEntity.unknownError();
      final error2 = ErrorEntity.unknownError();

      expect(error1, error2);
    });
  });
}
