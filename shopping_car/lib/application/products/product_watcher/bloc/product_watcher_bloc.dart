import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:shopping_car/domain/products/i_product_repository.dart';
import 'package:shopping_car/domain/products/product.dart';
import 'package:shopping_car/domain/products/product_failure.dart';

part 'product_watcher_event.dart';
part 'product_watcher_state.dart';
part 'product_watcher_bloc.freezed.dart';

@injectable
class ProductWatcherBloc extends Bloc<ProductWatcherEvent, ProductWatcherState> {
  final IProductRepository _productRepository;

  ProductWatcherBloc(this._productRepository) : super(const ProductWatcherState.initial());

  StreamSubscription<Either<ProductFailure, KtList<Product>>> _productsStreamSubscription;

  @override
  Stream<ProductWatcherState> mapEventToState(
    ProductWatcherEvent event,
  ) async* {
    yield* event.map(
      watchAllStarted: (e) async* {
        yield const ProductWatcherState.loadInProgress();
        await _productsStreamSubscription?.cancel();
        _productsStreamSubscription = _productRepository.getAllData().listen(
              (failureOrNotes) => add(ProductWatcherEvent.notesReceived(failureOrNotes)),
            );
      },
      notesReceived: (e) async* {
        yield e.failureOrNotes.fold(
          (f) => ProductWatcherState.loadFailure(f),
          (notes) => ProductWatcherState.loadSuccess(notes),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _productsStreamSubscription?.cancel();
    return super.close();
  }
}
