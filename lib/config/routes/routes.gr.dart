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
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;

import '../../domain/Entitys/news.dart' as _i14;
import '../../domain/Entitys/shoes.dart' as _i15;
import '../../presentation/LandingPage/landingpage.dart' as _i8;
import '../../presentation/NewsPage/news_detail/news_detail.dart' as _i6;
import '../../presentation/NewsPage/newspage.dart' as _i10;
import '../../presentation/NewsPage/widgets/news_form.dart' as _i4;
import '../../presentation/ShoesPage/newspage.dart' as _i3;
import '../../presentation/SignUP/signup_page.dart' as _i2;
import '../../presentation/Splash/splashpage.dart' as _i1;
import '../../presentation/todo/shoes_fomr.dart' as _i5;
import '../../presentation/todo/todopage.dart' as _i9;
import '../../presentation/userpage/userpage.dart' as _i11;
import 'pageseroutes.dart' as _i7;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    SignUpPageRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SignUpPage(),
      );
    },
    ShoesPageRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ShoesPage(),
        fullscreenDialog: true,
      );
    },
    NewsFormRoute.name: (routeData) {
      final args = routeData.argsAs<NewsFormRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.NewsForm(
          key: args.key,
          news: args.news,
        ),
        fullscreenDialog: true,
      );
    },
    ShoesFormRoute.name: (routeData) {
      final args = routeData.argsAs<ShoesFormRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.ShoesForm(
          key: args.key,
          shoes: args.shoes,
        ),
        fullscreenDialog: true,
      );
    },
    NewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailRouteArgs>(
          orElse: () => const NewsDetailRouteArgs());
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.NewsDetail(
          key: args.key,
          news: args.news,
        ),
        fullscreenDialog: true,
      );
    },
    HomePageRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.HomePage(),
      );
    },
    LandingPageRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.LandingPage(),
      );
    },
    TodoPageRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.TodoPage(),
      );
    },
    NewsPageRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.NewsPage(),
      );
    },
    UserPageRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.UserPage(),
      );
    },
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(
          SplashPageRoute.name,
          path: '/',
        ),
        _i12.RouteConfig(
          SignUpPageRoute.name,
          path: '/sign-up-page',
        ),
        _i12.RouteConfig(
          ShoesPageRoute.name,
          path: '/shoes-page',
        ),
        _i12.RouteConfig(
          NewsFormRoute.name,
          path: '/news-form',
        ),
        _i12.RouteConfig(
          ShoesFormRoute.name,
          path: '/shoes-form',
        ),
        _i12.RouteConfig(
          NewsDetailRoute.name,
          path: '/news-detail',
        ),
        _i12.RouteConfig(
          HomePageRoute.name,
          path: '/home-page',
          children: [
            _i12.RouteConfig(
              LandingPageRoute.name,
              path: 'landing-page',
              parent: HomePageRoute.name,
            ),
            _i12.RouteConfig(
              TodoPageRoute.name,
              path: 'todo-page',
              parent: HomePageRoute.name,
            ),
            _i12.RouteConfig(
              NewsPageRoute.name,
              path: 'news-page',
              parent: HomePageRoute.name,
            ),
            _i12.RouteConfig(
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
class SplashPageRoute extends _i12.PageRouteInfo<void> {
  const SplashPageRoute()
      : super(
          SplashPageRoute.name,
          path: '/',
        );

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.SignUpPage]
class SignUpPageRoute extends _i12.PageRouteInfo<void> {
  const SignUpPageRoute()
      : super(
          SignUpPageRoute.name,
          path: '/sign-up-page',
        );

  static const String name = 'SignUpPageRoute';
}

/// generated route for
/// [_i3.ShoesPage]
class ShoesPageRoute extends _i12.PageRouteInfo<void> {
  const ShoesPageRoute()
      : super(
          ShoesPageRoute.name,
          path: '/shoes-page',
        );

  static const String name = 'ShoesPageRoute';
}

/// generated route for
/// [_i4.NewsForm]
class NewsFormRoute extends _i12.PageRouteInfo<NewsFormRouteArgs> {
  NewsFormRoute({
    _i13.Key? key,
    required _i14.News? news,
  }) : super(
          NewsFormRoute.name,
          path: '/news-form',
          args: NewsFormRouteArgs(
            key: key,
            news: news,
          ),
        );

  static const String name = 'NewsFormRoute';
}

class NewsFormRouteArgs {
  const NewsFormRouteArgs({
    this.key,
    required this.news,
  });

  final _i13.Key? key;

  final _i14.News? news;

  @override
  String toString() {
    return 'NewsFormRouteArgs{key: $key, news: $news}';
  }
}

/// generated route for
/// [_i5.ShoesForm]
class ShoesFormRoute extends _i12.PageRouteInfo<ShoesFormRouteArgs> {
  ShoesFormRoute({
    _i13.Key? key,
    required _i15.Shoes? shoes,
  }) : super(
          ShoesFormRoute.name,
          path: '/shoes-form',
          args: ShoesFormRouteArgs(
            key: key,
            shoes: shoes,
          ),
        );

  static const String name = 'ShoesFormRoute';
}

class ShoesFormRouteArgs {
  const ShoesFormRouteArgs({
    this.key,
    required this.shoes,
  });

  final _i13.Key? key;

  final _i15.Shoes? shoes;

  @override
  String toString() {
    return 'ShoesFormRouteArgs{key: $key, shoes: $shoes}';
  }
}

/// generated route for
/// [_i6.NewsDetail]
class NewsDetailRoute extends _i12.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    _i13.Key? key,
    _i14.News? news,
  }) : super(
          NewsDetailRoute.name,
          path: '/news-detail',
          args: NewsDetailRouteArgs(
            key: key,
            news: news,
          ),
        );

  static const String name = 'NewsDetailRoute';
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({
    this.key,
    this.news,
  });

  final _i13.Key? key;

  final _i14.News? news;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, news: $news}';
  }
}

/// generated route for
/// [_i7.HomePage]
class HomePageRoute extends _i12.PageRouteInfo<void> {
  const HomePageRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          path: '/home-page',
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i8.LandingPage]
class LandingPageRoute extends _i12.PageRouteInfo<void> {
  const LandingPageRoute()
      : super(
          LandingPageRoute.name,
          path: 'landing-page',
        );

  static const String name = 'LandingPageRoute';
}

/// generated route for
/// [_i9.TodoPage]
class TodoPageRoute extends _i12.PageRouteInfo<void> {
  const TodoPageRoute()
      : super(
          TodoPageRoute.name,
          path: 'todo-page',
        );

  static const String name = 'TodoPageRoute';
}

/// generated route for
/// [_i10.NewsPage]
class NewsPageRoute extends _i12.PageRouteInfo<void> {
  const NewsPageRoute()
      : super(
          NewsPageRoute.name,
          path: 'news-page',
        );

  static const String name = 'NewsPageRoute';
}

/// generated route for
/// [_i11.UserPage]
class UserPageRoute extends _i12.PageRouteInfo<void> {
  const UserPageRoute()
      : super(
          UserPageRoute.name,
          path: 'user-page',
        );

  static const String name = 'UserPageRoute';
}
