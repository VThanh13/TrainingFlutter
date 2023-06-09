
import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';
@AutoRouterConfig()
class AppRouter extends $AppRouter{
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoadingRoute.page, initial: true),
    AutoRoute(page: LoginOrRegister.page,),
    AutoRoute(page: LoginRoute.page,),
    AutoRoute(page: RegisterRoute.page,),
    AutoRoute(page: HomeRoute.page,),
    AutoRoute(page: TopSearch.page,),
    AutoRoute(page: SearchResult.page,),
    AutoRoute(page: UserTop.page,),
  ];
}