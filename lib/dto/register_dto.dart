import 'package:meta/meta.dart';

class RegisterDto {
  final String email;
  final String firstName;
  final String lastName;
  final String password;

  const RegisterDto({
    @required this.email,
    @required this.firstName,
    @required this.lastName,
    @required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      "email": email.toLowerCase().replaceAll(" ", ""),
      "firstName": firstName,
      "lastName": lastName,
      "password": password,
    };
  }
}
