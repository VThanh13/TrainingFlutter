// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:code/biz_design/user_home/user_home_2/top_search_screen.dart'
    as _i1;
import 'package:code/biz_design/user_home/user_home_screen/home_screen.dart'
    as _i2;
import 'package:code/biz_design/user_login/login_or_register_screen/login_or_register.dart'
    as _i3;
import 'package:code/biz_design/user_login/login_screen/login_screen.dart'
    as _i4;
import 'package:code/biz_design/user_login/register_screen/register_screen.dart'
    as _i5;
import 'package:code/biz_design/user_login/splash_screen/loading_page.dart'
    as _i6;
import 'package:code/biz_design/user_screen/user_top_screen/user_top.dart'
    as _i7;
import 'package:code/biz_design/user_search/search_recently_login_user/search_result.dart'
    as _i8;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    TopSearch.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.TopSearch(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    LoginOrRegister.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginOrRegister(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RegisterScreen(),
      );
    },
    LoadingRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.LoadingPage(),
      );
    },
    UserTop.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.UserTop(),
      );
    },
    SearchResult.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SearchResult(),
      );
    },
  };
}

/// generated route for
/// [_i1.TopSearch]
class TopSearch extends _i9.PageRouteInfo<void> {
  const TopSearch({List<_i9.PageRouteInfo>? children})
      : super(
          TopSearch.name,
          initialChildren: children,
        );

  static const String name = 'TopSearch';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginOrRegister]
class LoginOrRegister extends _i9.PageRouteInfo<void> {
  const LoginOrRegister({List<_i9.PageRouteInfo>? children})
      : super(
          LoginOrRegister.name,
          initialChildren: children,
        );

  static const String name = 'LoginOrRegister';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.RegisterScreen]
class RegisterRoute extends _i9.PageRouteInfo<void> {
  const RegisterRoute({List<_i9.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LoadingPage]
class LoadingRoute extends _i9.PageRouteInfo<void> {
  const LoadingRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.UserTop]
class UserTop extends _i9.PageRouteInfo<void> {
  const UserTop({List<_i9.PageRouteInfo>? children})
      : super(
          UserTop.name,
          initialChildren: children,
        );

  static const String name = 'UserTop';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SearchResult]
class SearchResult extends _i9.PageRouteInfo<void> {
  const SearchResult({List<_i9.PageRouteInfo>? children})
      : super(
          SearchResult.name,
          initialChildren: children,
        );

  static const String name = 'SearchResult';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
