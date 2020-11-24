// ignore: constant_identifier_names
const STAGE_DEVELOPMENT = 'development';
// ignore: constant_identifier_names
const STAGE_TESTING = 'testing';
// ignore: constant_identifier_names
const STAGE_PRODUCTION = 'production';

class Config {
  // ignore: constant_identifier_names
  static const BASE_URL = String.fromEnvironment("base_url");
  // ignore: constant_identifier_names
  static const APP_MODE =
      String.fromEnvironment("mode", defaultValue: STAGE_DEVELOPMENT);
}
