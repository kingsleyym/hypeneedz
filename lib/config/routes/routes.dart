import 'package:auto_route/auto_route.dart';
import 'package:hypeneedz/config/routes/pageseroutes.dart';

import '../../presentation/LandingPage/landingpage.dart';
import '../../presentation/NewsPage/newspage.dart';
import '../../presentation/ShoesPage/newspage.dart';
import '../../presentation/SignUP/signup_page.dart';
import '../../presentation/Splash/splashpage.dart';
import '../../presentation/todo/todopage.dart';
import '../../presentation/userpage/userpage.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: SplashPage, initial: true),
  AutoRoute(page: SignUpPage, initial: false),
  AutoRoute(page: ShoesPage, fullscreenDialog: true, initial: false),
  AutoRoute(page: HomePage, initial: false, children: [
    AutoRoute(page: LandingPage, initial: false),
    AutoRoute(page: TodoPage, initial: false),
    AutoRoute(page: NewsPage, initial: false),
    AutoRoute(page: UserPage, initial: false)
  ])
]) // <--- Add this line
class $AppRouter {} // <--- And this line
