import 'package:flutter_test/flutter_test.dart';
import 'package:geldstroom_web_flutter/util/api/api.dart';

void main() {
  group("Api()", () {
    final fakeBearer = 'wwekwqoekwqoekwoqdsam,xz';
    final api = Api();

    test(
        'setDefaultAuthHeader(), given a token and '
        'should set dio Authorization Header', () {
      api.setDefaultAuthHeader(fakeBearer);
      expect(api.dio.options.headers["Authorization"], "Bearer $fakeBearer");
    });

    test(
        'removeDefaultAuthHeader(), should should set dio '
        'Authorization Header to empty string', () {
      api.removeDefaultAuthHeader();
      expect(api.dio.options.headers["Authorization"], "");
    });
  });
}
