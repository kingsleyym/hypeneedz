// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:hypeneedz/config/routes/pageseroutes.dart' as _i1;
import 'package:hypeneedz/domain/Entitys/news.dart' as _i14;
import 'package:hypeneedz/domain/Entitys/shoes.dart' as _i15;
import 'package:hypeneedz/presentation/LandingPage/landingpage.dart' as _i2;
import 'package:hypeneedz/presentation/NewsPage/news_detail/news_detail.dart'
    as _i3;
import 'package:hypeneedz/presentation/NewsPage/newspage.dart' as _i5;
import 'package:hypeneedz/presentation/NewsPage/widgets/news_form.dart' as _i4;
import 'package:hypeneedz/presentation/ShoesPage/newspage.dart' as _i7;
import 'package:hypeneedz/presentation/SignUP/signup_page.dart' as _i8;
import 'package:hypeneedz/presentation/Splash/splashpage.dart' as _i9;
import 'package:hypeneedz/presentation/todo/shoes_fomr.dart' as _i6;
import 'package:hypeneedz/presentation/todo/todopage.dart' as _i10;
import 'package:hypeneedz/presentation/userpage/userpage.dart' as _i11;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    LandingRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LandingPage(),
      );
    },
    NewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailRouteArgs>(
          orElse: () => const NewsDetailRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.NewsDetailPage(
          key: args.key,
          news: args.news,
        ),
      );
    },
    NewsFormRoute.name: (routeData) {
      final args = routeData.argsAs<NewsFormRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.NewsFormPage(
          key: args.key,
          news: args.news,
        ),
      );
    },
    NewsRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.NewsPage(),
      );
    },
    ShoesFormRoute.name: (routeData) {
      final args = routeData.argsAs<ShoesFormRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ShoesFormPage(
          key: args.key,
          shoes: args.shoes,
        ),
      );
    },
    ShoesRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ShoesPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SignUpPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SplashPage(),
      );
    },
    TodoRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.TodoPage(),
      );
    },
    UserRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.UserPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LandingPage]
class LandingRoute extends _i12.PageRouteInfo<void> {
  const LandingRoute({List<_i12.PageRouteInfo>? children})
      : super(
          LandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.NewsDetailPage]
class NewsDetailRoute extends _i12.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    _i13.Key? key,
    _i14.News? news,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          NewsDetailRoute.name,
          args: NewsDetailRouteArgs(
            key: key,
            news: news,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsDetailRoute';

  static const _i12.PageInfo<NewsDetailRouteArgs> page =
      _i12.PageInfo<NewsDetailRouteArgs>(name);
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
/// [_i4.NewsFormPage]
class NewsFormRoute extends _i12.PageRouteInfo<NewsFormRouteArgs> {
  NewsFormRoute({
    _i13.Key? key,
    required _i14.News? news,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          NewsFormRoute.name,
          args: NewsFormRouteArgs(
            key: key,
            news: news,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsFormRoute';

  static const _i12.PageInfo<NewsFormRouteArgs> page =
      _i12.PageInfo<NewsFormRouteArgs>(name);
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
/// [_i5.NewsPage]
class NewsRoute extends _i12.PageRouteInfo<void> {
  const NewsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ShoesFormPage]
class ShoesFormRoute extends _i12.PageRouteInfo<ShoesFormRouteArgs> {
  ShoesFormRoute({
    _i13.Key? key,
    required _i15.Shoes? shoes,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ShoesFormRoute.name,
          args: ShoesFormRouteArgs(
            key: key,
            shoes: shoes,
          ),
          initialChildren: children,
        );

  static const String name = 'ShoesFormRoute';

  static const _i12.PageInfo<ShoesFormRouteArgs> page =
      _i12.PageInfo<ShoesFormRouteArgs>(name);
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
/// [_i7.ShoesPage]
class ShoesRoute extends _i12.PageRouteInfo<void> {
  const ShoesRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ShoesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShoesRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SignUpPage]
class SignUpRoute extends _i12.PageRouteInfo<void> {
  const SignUpRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SplashPage]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.TodoPage]
class TodoRoute extends _i12.PageRouteInfo<void> {
  const TodoRoute({List<_i12.PageRouteInfo>? children})
      : super(
          TodoRoute.name,
          initialChildren: children,
        );

  static const String name = 'TodoRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.UserPage]
class UserRoute extends _i12.PageRouteInfo<void> {
  const UserRoute({List<_i12.PageRouteInfo>? children})
      : super(
          UserRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
