// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'application/products/product_watcher/bloc/product_watcher_bloc.dart';
import 'domain/products/i_product_repository.dart';
import 'infrastructure/core/firebase_injectable_module.dart';
import 'infrastructure/product/product_repository.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<FirebaseFirestore>(() => firebaseInjectableModule.firestore);
  gh.lazySingleton<IProductRepository>(() => ProductRepository(get<FirebaseFirestore>()));
  gh.factory<ProductWatcherBloc>(() => ProductWatcherBloc(get<IProductRepository>()));
  return get;
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}
