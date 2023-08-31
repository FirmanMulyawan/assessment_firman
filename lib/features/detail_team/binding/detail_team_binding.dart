import 'package:get/get.dart';

import '../presentation/detail_team_controller.dart';

class DetailTeamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailTeamController());
  }
}
