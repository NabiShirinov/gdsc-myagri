// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    FieldRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FieldScreen(),
      );
    },
    FormRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FormScreen(),
      );
    },
    SelectCropRoute.name: (routeData) {
      final args = routeData.argsAs<SelectCropRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SelectCropScreen(
          key: args.key,
          models: args.models,
          id: args.id,
        ),
      );
    },
    HealthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HealthScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    MapRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MapScreen(),
      );
    },
    BottomNavBarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BottomNavBarScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [FieldScreen]
class FieldRoute extends PageRouteInfo<void> {
  const FieldRoute({List<PageRouteInfo>? children})
      : super(
          FieldRoute.name,
          initialChildren: children,
        );

  static const String name = 'FieldRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FormScreen]
class FormRoute extends PageRouteInfo<void> {
  const FormRoute({List<PageRouteInfo>? children})
      : super(
          FormRoute.name,
          initialChildren: children,
        );

  static const String name = 'FormRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SelectCropScreen]
class SelectCropRoute extends PageRouteInfo<SelectCropRouteArgs> {
  SelectCropRoute({
    Key? key,
    required List<FieldModel> models,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          SelectCropRoute.name,
          args: SelectCropRouteArgs(
            key: key,
            models: models,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectCropRoute';

  static const PageInfo<SelectCropRouteArgs> page =
      PageInfo<SelectCropRouteArgs>(name);
}

class SelectCropRouteArgs {
  const SelectCropRouteArgs({
    this.key,
    required this.models,
    required this.id,
  });

  final Key? key;

  final List<FieldModel> models;

  final int id;

  @override
  String toString() {
    return 'SelectCropRouteArgs{key: $key, models: $models, id: $id}';
  }
}

/// generated route for
/// [HealthScreen]
class HealthRoute extends PageRouteInfo<void> {
  const HealthRoute({List<PageRouteInfo>? children})
      : super(
          HealthRoute.name,
          initialChildren: children,
        );

  static const String name = 'HealthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MapScreen]
class MapRoute extends PageRouteInfo<void> {
  const MapRoute({List<PageRouteInfo>? children})
      : super(
          MapRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BottomNavBarScreen]
class BottomNavBarRoute extends PageRouteInfo<void> {
  const BottomNavBarRoute({List<PageRouteInfo>? children})
      : super(
          BottomNavBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavBarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
