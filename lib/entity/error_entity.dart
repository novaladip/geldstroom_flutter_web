import "package:meta/meta.dart";
import "package:equatable/equatable.dart";

class ErrorEntity extends Equatable {
  final String message;
  final String errorCode;
  final Map<String, dynamic> error;

  const ErrorEntity({
    @required this.message,
    @required this.errorCode,
    this.error,
  });

  factory ErrorEntity.fromJSON(Map<String, dynamic> json) {
    return ErrorEntity(
      message: json["message"],
      errorCode: json["errorCode"],
      error: json["error"] ?? null,
    );
  }

  factory ErrorEntity.networkError() {
    return ErrorEntity(
      message: "Network Error",
      errorCode: "NETWORK_0001",
    );
  }

  factory ErrorEntity.unknownError() {
    return ErrorEntity(
      message: "Unknown error occurs, please try again.",
      errorCode: "UNKNOWN_0001",
    );
  }

  @override
  List<Object> get props => [message, errorCode, error];
}

class UserErrorCode {
  static const duplicateEmail = "USER_0001";
  static const emailIsNotVerified = "USER_0002";
  static const invalidCredentials = "USER_0003";
  static const userNotFound = "USER_0004";
  static const emailIsAlreadyVerified = "USER_0005";
  static const validationError = "USER_400";
}
