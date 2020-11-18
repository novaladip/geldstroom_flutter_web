// ignore: constant_identifier_names
const STAGE_DEVELOPMENT = 'development';
// ignore: constant_identifier_names
const STAGE_TESTING = 'testing';
// ignore: constant_identifier_names
const STAGE_PRODUCTION = 'production';

class Config {
  // ignore: constant_identifier_names
  static const BASE_URL = 'https://geldstroom.cotcapp.my.id/api';
  // ignore: constant_identifier_names
  // ignore: non_constant_identifier_names
  static final APP_MODE =
      String.fromEnvironment("mode", defaultValue: STAGE_DEVELOPMENT);
}
