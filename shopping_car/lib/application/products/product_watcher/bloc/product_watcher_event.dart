part of 'product_watcher_bloc.dart';

@freezed
abstract class ProductWatcherEvent with _$ProductWatcherEvent {
  const factory ProductWatcherEvent.watchAllStarted() = _WatchAllStarted;
  const factory ProductWatcherEvent.notesReceived(
    Either<ProductFailure, KtList<Product>> failureOrNotes,
  ) = _ProductsReceived;
}
