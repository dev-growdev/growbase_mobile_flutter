import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import '../../../shared/adapters/make_request.adapter.dart';
import '../../../shared/entities/user_auth.entity.dart';
import '../../../shared/view/stores/app.store.dart';
import '../services/get_user.service.dart';
import '../services/load_saved_token.service.dart';

class SplashStore {
  final LoadSavedTokenService _savedTokenService;
  final GetUserService _getUserService;

  const SplashStore({
    required LoadSavedTokenService savedTokenService,
    required GetUserService getUserService,
  })  : _savedTokenService = savedTokenService,
        _getUserService = getUserService;

  Future<bool> userIsLogged() async {
    final token = await _savedTokenService();

    if (token == null) {
      return false;
    }

    final resultOrError = await makeRequest(() => _getUserService());

    if (resultOrError.isLeft()) {
      return false;
    }

    final AppStore appStore = GetIt.I();

    appStore.addUser((resultOrError.fold(id, id) as UserAuth).user);

    return true;
  }
}
