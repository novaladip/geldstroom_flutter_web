// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api.dart';
import '../../service/auth_service.dart';
import 'register_module.dart';

/// Environment names
const _testing = 'testing';
const _development = 'development';
const _production = 'production';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<Api>(() => Api());
  gh.lazySingleton<IAuthService>(() => MockAuthService(),
      registerFor: {_testing});
  gh.lazySingleton<IAuthService>(() => AuthService(get<Api>()),
      registerFor: {_development, _production});
  final sharedPreferences = await registerModule.pref;
  gh.factory<SharedPreferences>(() => sharedPreferences);
  return get;
}

class _$RegisterModule extends RegisterModule {}
