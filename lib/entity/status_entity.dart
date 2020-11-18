import 'package:freezed_annotation/freezed_annotation.dart';

import './error_entity.dart';

part 'status_entity.freezed.dart';

@freezed
abstract class FormStatus with _$FormStatus {
  const factory FormStatus.idle() = FormStatusIdle;
  const factory FormStatus.loading() = FormStatusLoading;
  const factory FormStatus.error({
    @required ErrorEntity error,
  }) = FormStatusError;
  const factory FormStatus.success() = FormStatusSuccess;
}

@freezed
abstract class FetchStatus with _$FetchStatus {
  const factory FetchStatus.loading() = FetchStatusLoading;
  const factory FetchStatus.error({
    @required ErrorEntity error,
  }) = FetchStatusError;
  const factory FetchStatus.loaded() = FetchStatusLoaded;
  const factory FetchStatus.refresh() = FetchStatusRefresh;
  const factory FetchStatus.refreshError() = FetchStatusRefreshError;
  const factory FetchStatus.loadMore() = FetchStatusLoadMore;
  const factory FetchStatus.loadMoreError() = FetchStatusLoadMoreError;
}
