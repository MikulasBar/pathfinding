
import 'package:auto_route/auto_route.dart';
import 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class Router extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: DocRoute.page, initial: true),
    AutoRoute(page: ConfigRoute.page),
    AutoRoute(page: PositionConfigRoute.page),
    AutoRoute(page: StatsRoute.page),
    AutoRoute(page: AnimationRoute.page),
  ];
}