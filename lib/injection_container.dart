import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/authentication/services/create_account.service.dart';
import 'features/authentication/services/login.service.dart';
import 'features/authentication/services/recovery_password.service.dart';
import 'features/authentication/services/save_user_logged.service.dart';
import 'features/authentication/services/send_verification_code.service.dart';
import 'features/authentication/services/verify_account.service.dart';
import 'features/categories/services/create_category.service.dart';
import 'features/categories/services/get_categories.service.dart';
import 'features/categories/services/get_category.service.dart';
import 'features/categories/services/update_category.service.dart';
import 'features/help_desk/services/get_faqs.service.dart';
import 'features/help_desk/services/request_help.service.dart';
import 'features/profile/services/update_password.service.dart';
import 'features/profile/services/update_profile.service.dart';
import 'shared/adapters/api.adapter.dart';
import 'shared/adapters/shared_preference.adapter.dart';
import 'shared/services/get_terms_and_policy.service.dart';
import 'shared/view/stores/app.store.dart';
import 'utils/constants/app.constants.dart';

// coverage:ignore-start

// service locator
final sl = GetIt.I;

void slLibs() {
  sl.registerLazySingleton<Dio>(
    () => Dio(BaseOptions(baseUrl: AppConstants.baseUrl)),
  );
}

void slShared() {
  // adapters
  sl.registerLazySingleton<IHttpAdapter>(() => ApiAdapter(sl()));
  sl.registerLazySingleton<ILocalStorage>(() => SharedPreferenceStorage());

  // services
  sl.registerLazySingleton<GetTermsAndPolicyService>(
      () => GetTermsAndPolicyService(sl()));

  // stores
  sl.registerLazySingleton<AppStore>(() => AppStore());
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
  sl.registerLazySingleton<SaveUserLoggedService>(
      () => SaveUserLoggedService(localStorage: sl(), appStore: sl()));
  sl.registerLazySingleton<RecoveryPasswordService>(
      () => RecoveryPasswordService(sl()));
}

void slProfile() {
  // services
  sl.registerLazySingleton<UpdateProfileService>(
      () => UpdateProfileService(sl()));
  sl.registerLazySingleton(() => UpdatePasswordService(sl()));
}

void slHelpDesk() {
  // services
  sl.registerLazySingleton<GetFaqsService>(() => GetFaqsService(sl()));
  sl.registerLazySingleton<RequestHelpService>(() => RequestHelpService(sl()));
}

void init() {
  slLibs();
  slShared();
  slCategories();
  slAuthentication();
  slProfile();
  slHelpDesk();
}

// coverage:ignore-end