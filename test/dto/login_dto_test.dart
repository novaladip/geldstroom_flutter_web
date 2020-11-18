import 'package:flutter_test/flutter_test.dart';
import 'package:geldstroom_web_flutter/dto/dto.dart';

void main() {
  test(
      'LoginDto.toMap() given an email and password '
      'should return map base on given value', () {
    final email = 'john@email.com';
    final password = 'somepassword';
    final dto = LoginDto(email, password);
    expect(dto.toMap(), {'email': email, 'password': password});
  });
}
