import 'package:enigma/feature/map/provider/maps_provider.dart';
import 'package:enigma/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  final appRouter = AppRouter();
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MapState(),
          ),
        ],
        child: MaterialApp.router(
          title: 'Enigma',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
          ),
          routerConfig: appRouter.config(),
        ),
      ),
    ),
  );
}
