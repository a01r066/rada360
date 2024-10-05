import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rada360/services/local/repositories/pref_repository.dart';
import 'package:rada360/services/remote/network/api_services.dart';
import 'package:rada360/services/remote/network/dio/dio_client.dart';
import 'package:rada360/services/remote/repositories/api_repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

setupServicesLocator() async {
  // Pref repository
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton<PrefRepository>(
      () => PrefRepository(preferences: sharedPreferences));

  // Dio
  locator.registerSingleton(Dio());
  locator.registerSingleton(DioClient(locator.get<Dio>()));

  // Services
  locator.registerLazySingleton<ApiServices>(
      () => ApiServices(dioClient: locator.get()));

  // Repositories
  locator.registerLazySingleton<ApiRepositories>(
      () => ApiRepositories(apiServices: locator.get()));
}
