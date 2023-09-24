import 'package:auto_route/auto_route.dart';

import 'package:hypeneedz/config/routes/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: ShoesRoute.page, fullscreenDialog: false),
    AutoRoute(page: NewsFormRoute.page, fullscreenDialog: true),
    AutoRoute(
        page: ShoesFormRoute.page, initial: false, fullscreenDialog: true),
    AutoRoute(
        page: NewsDetailRoute.page, initial: false, fullscreenDialog: true),
    AutoRoute(page: HomeRoute.page, initial: false, children: [
      AutoRoute(page: LandingRoute.page, initial: false),
      AutoRoute(page: TodoRoute.page, initial: false),
      AutoRoute(page: NewsRoute.page, initial: false),
      AutoRoute(page: UserRoute.page)
    ])
  ];
}
