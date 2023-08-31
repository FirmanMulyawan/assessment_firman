import 'package:assessment_firman/features/home/repository/home_transaction_history_datasource.dart';
import 'package:get/get.dart';
import '../../../components/util/network.dart';
import '../../my_favorite/presentation/my_favorite_controller.dart';
import '../presentation/home_navigation_controller.dart';
import '../presentation/homepage/homepage_controller.dart';
import '../repository/home_transaction_history_repository.dart';

class HomeNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeNavigationController(storageUtil: Get.find()));
    Get.lazyPut(() => HomePageController(Get.find()), fenix: true);
    Get.lazyPut(() => HomePageRepository(Get.find()));
    Get.lazyPut(() => MyFavoriteController(), fenix: true);
    Get.lazyPut(() => HomePageDataSource(Network.dioClient()));
  }
}
