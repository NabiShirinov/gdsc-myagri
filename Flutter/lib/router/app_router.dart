import 'package:auto_route/auto_route.dart';
import 'package:enigma/feature/form/field_model.dart';
import 'package:flutter/cupertino.dart';

import '../feature/field/view/field_view.dart';
import '../feature/form/view/form_view.dart';
import '../feature/form/view/select_crop.dart';
import '../feature/health/view/soil_health.dart';
import '../feature/home/view/home_view.dart';
import '../feature/map/view/maps.dart';
import '../main_view.dart';
import '../splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: '/splash',
          initial: true,
        ),
        AutoRoute(
          page: BottomNavBarRoute.page,
          path: '/main',
          children: [
            AutoRoute(
              page: HomeRoute.page,
              path: 'home',
              initial: true,
            ),
            AutoRoute(
              page: MapRoute.page,
              path: 'map',
            ),
          ],
        ),
        AutoRoute(
          page: FieldRoute.page,
          path: '/field',
        ),
        AutoRoute(
          page: HealthRoute.page,
          path: '/health',
        ),
        AutoRoute(
          page: FormRoute.page,
          path: '/form',
        ),
        AutoRoute(
          page: SelectCropRoute.page,
          path: '/crop',
        ),
      ];
}
