import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'core/utils/constants.dart';
import 'services/base_api.dart';
import 'services/network_info.dart';

var sl = GetIt.instance;

Future<void> initLocator() async {
  sl.allowReassignment = true;

  ///////////////
  //! External
  ///////////////
  // Dio
  sl.registerSingleton(
    Dio(
      BaseOptions(
        baseUrl: BASE_URL
      ),
    )
      ..options.headers['Accept'] = 'application/json'
      ..options.headers['Content-Type'] = 'application/json'
  );
  sl.registerSingleton(
    BaseApi(sl()),
  );
  // Network
  sl.registerSingleton(
    Connectivity(),
  );
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  ///////////////
  ///! Bloc / Cubit
  ///////////////
  

  ///////////////
  /// Usecase
  ///////////////
  

  ///////////////
  /// Repository
  ///////////////
  

  ///////////////
  /// DataSource
  ///////////////
}