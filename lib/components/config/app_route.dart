import 'package:get/get_navigation/src/routes/get_route.dart';
// Splashscreen
import '../../features/splash/presentation/splash_screen.dart';
import '../../features/splash/binding/splash_binding.dart';
// home
import '../../features/home/presentation/home_navigation_screen.dart';
import '../../features/home/binding/home_navigation_binding.dart';
// detail
import '../../features/detail_team/detail_team_route.dart';

class AppRoute {
  static const String defaultRoute = '/';
  static const String notFound = '/notFound';
  static const String homeScreen = '/homeScreen';
  static List<GetPage> pages = [
        GetPage(
            name: defaultRoute,
            page: () => const SplashScreen(),
            binding: SplashBinding()),
        GetPage(
            name: homeScreen,
            page: () => const HomeNavigationScreen(),
            binding: HomeNavigationBinding()),
      ] +
      DetailTeamRoute.pages;
}
