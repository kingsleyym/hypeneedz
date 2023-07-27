// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../../presentation/LandingPage/landingpage.dart' as _i5;
import '../../presentation/NewsPage/newspage.dart' as _i7;
import '../../presentation/ShoesPage/newspage.dart' as _i3;
import '../../presentation/SignUP/signup_page.dart' as _i2;
import '../../presentation/Splash/splashpage.dart' as _i1;
import '../../presentation/todo/todopage.dart' as _i6;
import '../../presentation/userpage/userpage.dart' as _i8;
import 'pageseroutes.dart' as _i4;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    SignUpPageRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SignUpPage(),
      );
    },
    ShoesPageRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ShoesPage(),
        fullscreenDialog: true,
      );
    },
    HomePageRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    LandingPageRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.LandingPage(),
      );
    },
    TodoPageRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.TodoPage(),
      );
    },
    NewsPageRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.NewsPage(),
      );
    },
    UserPageRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.UserPage(),
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          SplashPageRoute.name,
          path: '/',
        ),
        _i9.RouteConfig(
          SignUpPageRoute.name,
          path: '/sign-up-page',
        ),
        _i9.RouteConfig(
          ShoesPageRoute.name,
          path: '/shoes-page',
        ),
        _i9.RouteConfig(
          HomePageRoute.name,
          path: '/home-page',
          children: [
            _i9.RouteConfig(
              LandingPageRoute.name,
              path: 'landing-page',
              parent: HomePageRoute.name,
            ),
            _i9.RouteConfig(
              TodoPageRoute.name,
              path: 'todo-page',
              parent: HomePageRoute.name,
            ),
            _i9.RouteConfig(
              NewsPageRoute.name,
              path: 'news-page',
              parent: HomePageRoute.name,
            ),
            _i9.RouteConfig(
              UserPageRoute.name,
              path: 'user-page',
              parent: HomePageRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i9.PageRouteInfo<void> {
  const SplashPageRoute()
      : super(
          SplashPageRoute.name,
          path: '/',
        );

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.SignUpPage]
class SignUpPageRoute extends _i9.PageRouteInfo<void> {
  const SignUpPageRoute()
      : super(
          SignUpPageRoute.name,
          path: '/sign-up-page',
        );

  static const String name = 'SignUpPageRoute';
}

/// generated route for
/// [_i3.ShoesPage]
class ShoesPageRoute extends _i9.PageRouteInfo<void> {
  const ShoesPageRoute()
      : super(
          ShoesPageRoute.name,
          path: '/shoes-page',
        );

  static const String name = 'ShoesPageRoute';
}

/// generated route for
/// [_i4.HomePage]
class HomePageRoute extends _i9.PageRouteInfo<void> {
  const HomePageRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          path: '/home-page',
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i5.LandingPage]
class LandingPageRoute extends _i9.PageRouteInfo<void> {
  const LandingPageRoute()
      : super(
          LandingPageRoute.name,
          path: 'landing-page',
        );

  static const String name = 'LandingPageRoute';
}

/// generated route for
/// [_i6.TodoPage]
class TodoPageRoute extends _i9.PageRouteInfo<void> {
  const TodoPageRoute()
      : super(
          TodoPageRoute.name,
          path: 'todo-page',
        );

  static const String name = 'TodoPageRoute';
}

/// generated route for
/// [_i7.NewsPage]
class NewsPageRoute extends _i9.PageRouteInfo<void> {
  const NewsPageRoute()
      : super(
          NewsPageRoute.name,
          path: 'news-page',
        );

  static const String name = 'NewsPageRoute';
}

/// generated route for
/// [_i8.UserPage]
class UserPageRoute extends _i9.PageRouteInfo<void> {
  const UserPageRoute()
      : super(
          UserPageRoute.name,
          path: 'user-page',
        );

  static const String name = 'UserPageRoute';
}
