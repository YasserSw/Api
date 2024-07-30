import 'package:dio/dio.dart';
import 'package:flutter_application_3/cubit/my_cubit.dart';
import 'package:flutter_application_3/my_repo.dart';
import 'package:flutter_application_3/web_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void initget() {
  getIt.registerLazySingleton<MyCubit>(() => MyCubit(getIt()));
  getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt()));
  getIt.registerLazySingleton<WebServices>(() => WebServices(setupDio()));
}

Dio setupDio() {
  Dio dio = Dio();
  dio
    ..options.receiveTimeout = Duration(seconds: 30)
    ..options.connectTimeout = Duration(seconds: 30);
  dio.interceptors.add(LogInterceptor(
      request: true,
      error: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true));
  return dio;
}
