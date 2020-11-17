import 'package:flutter_test/flutter_test.dart';
import 'package:geldstroom_web_flutter/util/validator/validator.dart';

void main() {
  group("InputValidator", () {
    test(
        'InputValidator.email() given an empty string '
        'should return {fieldName} is cannot be empty', () {
      final input = '';
      final result = InputValidator.email(input, 'Email');
      expect(result, 'Email is cannot be empty');
    });

    test(
        'InputValidator.email() given an invalid email '
        'should return Invalid email address', () {
      final input = 'invalidemail@';
      final result = InputValidator.email(input, 'Email');
      expect(result, 'Invalid email address');
    });

    test('InputValidator.email() given a valid email and should return null',
        () {
      final input = 'valid@gmail.com';
      final result = InputValidator.email(input, 'Email');
      expect(result, null);
    });
  });

  group("InputValidator.required()", () {
    test("given an empty string and return {fieldName} is cannot be empty", () {
      final input = '';
      final result = InputValidator.required(input, "Input");
      expect(result, "Input is cannot be empty");
    });

    test("given an non empty string and should return null", () {
      final input = 'has value';
      final result = InputValidator.required(input, "Input");
      expect(result, null);
    });
  });

  group("InputValidator.isEqual()", () {
    test("given an invalid input and should return Invalid {fieldName}", () {
      final input = 'has value';
      final inputComparation = 'not equal';
      final result = InputValidator.isEqual(input, inputComparation, "Input");
      expect(result, "Invalid Input");
    });

    test("given a valid input and should return null", () {
      final input = 'has value';
      final inputComparation = 'has value';
      final result = InputValidator.isEqual(input, inputComparation, "Input");
      expect(result, null);
    });
  });

  group("InputValidation.amount()", () {
    test(
        "given an 0 string input and should return "
        " 'Amount must be greater than 0'", () {
      final input = "0";
      final result = InputValidator.amount(input);
      expect(result, "Amount must be greater than 0");
    });

    test(
        "given an empty string input and should return "
        "'Amount is cannot be empty'", () {
      final input = "";
      final result = InputValidator.amount(input);
      expect(result, "Amount is cannot be empty");
    });

    test("given a valid number of string input and should return null", () {
      final input = "100.000";
      final result = InputValidator.amount(input);
      expect(result, null);
    });
  });
}
