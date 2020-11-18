import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../constant/config.dart';
import '../dto/dto.dart';
import '../entity/error_entity.dart';
import '../util/api/api.dart';

abstract class IAuthService {
  Future<Either<ErrorEntity, String>> login(LoginDto dto);
  Future<Either<ErrorEntity, None>> register(RegisterDto dto);
}

@LazySingleton(as: IAuthService, env: [STAGE_TESTING])
class MockAuthService implements IAuthService {
  @override
  Future<Either<ErrorEntity, String>> login(LoginDto dto) async {
    return Future.delayed(Duration(seconds: 1), () {
      return Right('');
    });
  }

  @override
  Future<Either<ErrorEntity, None>> register(RegisterDto dto) async {
    return Future.delayed(Duration(seconds: 1), () {
      return Right(None());
    });
  }
}

@LazySingleton(as: IAuthService, env: [STAGE_DEVELOPMENT, STAGE_PRODUCTION])
class AuthService implements IAuthService {
  AuthService(this._api);
  final Api _api;

  @override
  Future<Either<ErrorEntity, String>> login(LoginDto dto) async {
    try {
      final res = await _api.dio.post(
        '/user/login',
        data: dto.toMap(),
      );
      final data = res.data;
      return Right(data['accessToken']);
    } on DioError catch (e) {
      if (e.response.statusCode >= 500) {
        return Left(ErrorEntity.unknownError());
      }

      if (e.response.data != null) {
        return Left(ErrorEntity.fromJSON(e.response.data));
      }

      return Left(ErrorEntity.networkError());
    }
  }

  @override
  Future<Either<ErrorEntity, None>> register(RegisterDto dto) async {
    try {
      await _api.dio.post('/user/register', data: dto.toMap());
      return Right(None());
    } on DioError catch (e) {
      if (e.response.data != null) {
        return Left(ErrorEntity.fromJSON(e.response.data));
      } else {
        return Left(ErrorEntity.networkError());
      }
    }
  }
}
