import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/authentication/services/create-account.service.dart';
import 'features/authentication/services/login.service.dart';
import 'features/categories/services/create-category.service.dart';
import 'features/categories/services/get-categories.service.dart';
import 'features/categories/services/get-category.service.dart';
import 'features/categories/services/update-category.service.dart';
import 'shared/adapters/api.adapter.dart';
import 'utils/constants.dart';

// coverage:ignore-start

// service locator
final sl = GetIt.I;

void slLibs() {
  sl.registerLazySingleton<Dio>(
    () => Dio(BaseOptions(baseUrl: Constants.url)),
  );
}

void slShared() {
  // adapters
  sl.registerLazySingleton<IHttpAdapter>(() => ApiAdapter(sl()));
}

void slCategories() {
  sl.registerLazySingleton<GetCategoriesService>(
      () => GetCategoriesService(sl()));
  sl.registerLazySingleton<CreateCategoryService>(
      () => CreateCategoryService(sl()));
  sl.registerLazySingleton<GetCategoryService>(() => GetCategoryService(sl()));
  sl.registerLazySingleton<UpdateCategoryService>(
      () => UpdateCategoryService(sl()));
}

void slAuthentication() {
  sl.registerLazySingleton<CreateAccountService>(
      () => CreateAccountService(sl()));
  sl.registerLazySingleton<LoginService>(() => LoginService(sl()));
}

void init() {
  slLibs();
  slShared();
  slCategories();
  slAuthentication();
}

// coverage:ignore-end