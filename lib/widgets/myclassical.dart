import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:icpbox/generated/l10n.dart';

///列表加载头部、底部默认样式
Header MyClassicalHeader() {
  return ClassicalHeader(
    enableInfiniteRefresh: false,
    refreshText: S().pullToRefresh,
    refreshReadyText: S().releaseToRefresh,
    refreshingText: S().refreshing,
    refreshedText: S().refreshed,
    refreshFailedText: S().refreshFailed,
    noMoreText: S().noMore,
    infoText: S().updateAt,
  );
}

Footer MyClassicalFooter() {
  return ClassicalFooter(
    loadText: S().pushToLoad,
    loadReadyText: S().releaseToLoad,
    loadingText: S().loading,
    loadedText: S().loaded,
    loadFailedText: S().loadFailed,
    noMoreText: S().noMore,
    infoText: S().updateAt,
  );
}
