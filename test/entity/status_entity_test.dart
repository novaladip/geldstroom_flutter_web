import 'package:flutter_test/flutter_test.dart';
import 'package:geldstroom_web_flutter/entity/error_entity.dart';
import 'package:geldstroom_web_flutter/entity/status_entity.dart';

void main() {
  group('StatusEntity', () {
    test('FetchStatus, should return true when comparing to the same object',
        () {
      final loading = FetchStatus.loading();
      expect(loading, FetchStatusLoading());

      final error = FetchStatus.error(error: ErrorEntity.networkError());
      expect(error is FetchStatusError, true);

      final loaded = FetchStatus.loaded();
      expect(loaded is FetchStatusLoaded, true);

      final refresh = FetchStatus.refresh();
      expect(refresh is FetchStatusRefresh, true);

      final refreshError = FetchStatus.refreshError();
      expect(refreshError is FetchStatusRefreshError, true);

      final loadMore = FetchStatus.loadMore();
      expect(loadMore is FetchStatusLoadMore, true);

      final loadMoreError = FetchStatus.loadMoreError();
      expect(loadMoreError is FetchStatusLoadMoreError, true);
    });

    test('FormStatus, should return true when comparing to the same object',
        () {
      final idle = FormStatus.idle();
      expect(idle is FormStatusIdle, true);

      final loading = FormStatus.loading();
      expect(loading is FormStatusLoading, true);

      final error = FormStatus.error(error: ErrorEntity.networkError());
      expect(error is FormStatusError, true);

      final success = FormStatus.success();
      expect(success is FormStatus, true);
    });
  });
}
