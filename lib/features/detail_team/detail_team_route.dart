import 'package:get/get_navigation/src/routes/get_route.dart';

import 'binding/detail_team_binding.dart';
import 'presentation/detail_team_screen.dart';

class DetailTeamRoute {
  static const String detailTeamScreen = '/detailTeamScreen';

  static List<GetPage> pages = [
    GetPage(
        name: detailTeamScreen,
        page: () => const DetailTeamScreen(),
        binding: DetailTeamBinding()),
  ];
}
