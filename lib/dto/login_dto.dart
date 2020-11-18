class LoginDto {
  const LoginDto(
    this.email,
    this.password,
  );

  final String email;
  final String password;

  Map<String, dynamic> toMap() {
    return {'email': email.toLowerCase(), 'password': password};
  }
}
