import 'package:e_delivery_app/Core/network/dio_client.dart';
import 'package:e_delivery_app/Features/Auth/Data/repos/auth_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<DioClient>(DioClient());
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
}
