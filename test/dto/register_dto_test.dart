import 'package:flutter_test/flutter_test.dart';
import 'package:geldstroom_web_flutter/dto/register_dto.dart';

void main() {
  test(
      'RegisterDto '
      'given data email, firstName, lastName and password. '
      'when toMap() method is called should return a Map base on given data',
      () {
    final email = 'john@email.com';
    final firstName = 'John';
    final lastName = 'Doe';
    final password = 'somePassword';

    final dto = RegisterDto(
      email: email,
      firstName: firstName,
      lastName: lastName,
      password: password,
    );

    expect(dto.toMap(), {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
    });
  });
}
