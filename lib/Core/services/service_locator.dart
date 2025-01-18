import 'package:e_delivery_app/Core/Data/Repos/app_repo_impl.dart';
import 'package:e_delivery_app/Core/network/dio_client.dart';
import 'package:e_delivery_app/Features/Auth/Data/repos/auth_repo_impl.dart';
import 'package:e_delivery_app/Features/Cart/data/repos/cart_repo_impl.dart';
import 'package:e_delivery_app/Features/Favorite/Data/Repos/get_favorite_products_repo_impl.dart';
import 'package:e_delivery_app/Features/Home/Data/Repos/home_repo_impl.dart';
import 'package:e_delivery_app/Features/Notifications/data/repos/notifications_repo.dart';
import 'package:e_delivery_app/Features/Notifications/data/repos/notifications_repo_impl.dart';
import 'package:e_delivery_app/Features/Orders/Data/repos/orders_repo_impl.dart';
import 'package:e_delivery_app/Features/Profile/data/repos/profile_repo_impl.dart';
import 'package:e_delivery_app/Features/Search/data/repos/search_repo_impl.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/manager/get_store_products_cubit/get_store_products_cubit.dart';
import 'package:e_delivery_app/Features/Store%20Details/data/repos/store_details_repo_impl.dart';
import 'package:e_delivery_app/Features/Stores/data/repos/stores_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<DioClient>(DioClient());
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
  getIt.registerSingleton<ProfileRepoImpl>(ProfileRepoImpl());
  getIt.registerSingleton<AppRepoImpl>(AppRepoImpl());
  getIt.registerSingleton<StoresRepoImpl>(StoresRepoImpl());
  getIt.registerSingleton<StoreDetailsRepoImpl>(StoreDetailsRepoImpl());
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl());
  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl());
  getIt.registerSingleton<NotificationsRepoImpl>(NotificationsRepoImpl());
  getIt.registerSingleton<GetFavoriteProductsRepoImpl>(
      GetFavoriteProductsRepoImpl());
  getIt.registerSingleton<CartRepoImpl>(CartRepoImpl());
  getIt.registerSingleton<OrdersRepoImpl>(OrdersRepoImpl());
  getIt.registerSingleton<GetStoreProductsCubit>(
      GetStoreProductsCubit(getIt.get<StoreDetailsRepoImpl>()));
}
