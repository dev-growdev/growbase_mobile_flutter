import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/authentication/services/create_account.service.dart';
import 'features/authentication/services/login.service.dart';
import 'features/authentication/services/send_verification_code.service.dart';
import 'features/authentication/services/verify_account.service.dart';
import 'features/categories/services/create_category.service.dart';
import 'features/categories/services/get_categories.service.dart';
import 'features/categories/services/get_category.service.dart';
import 'features/categories/services/update_category.service.dart';
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

  sl.registerLazySingleton<VerifyAccountService>(
      () => VerifyAccountService(sl()));
  sl.registerLazySingleton<SendVerificationCodeService>(
      () => SendVerificationCodeService(sl()));
}

void init() {
  slLibs();
  slShared();
  slCategories();
  slAuthentication();
}

// coverage:ignore-end