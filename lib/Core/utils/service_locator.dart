import 'package:e_delivery_app/Core/network/dio_client.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<DioClient>(DioClient());
}
