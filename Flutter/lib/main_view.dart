import 'package:auto_route/auto_route.dart';
import 'package:enigma/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      extendBody: true,
      routes: const [MapRoute(), HomeRoute()],
      bottomNavigationBuilder: (context, tabsRouter) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 64.w, vertical: 10.h),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32.r),
            child: Theme(
              data: ThemeData(
                splashColor: Colors.grey[200],
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) {
                  tabsRouter.setActiveIndex(index);
                },
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                    activeIcon: icon('map', Colors.black),
                    icon: icon('map', Colors.grey.shade600),
                    label: 'map',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: icon('home', Colors.black),
                    icon: icon('home', Colors.grey.shade600),
                    label: 'home',
                  ),
                  // BottomNavigationBarItem(
                  //   activeIcon: icon('profile', Colors.black),
                  //   icon: icon('profile', Colors.grey.shade600),
                  //   label: 'profile',
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget icon(String name, Color color) {
    return SvgPicture.asset(
      'assets/$name.svg',
      colorFilter: ColorFilter.mode(
        color,
        BlendMode.srcIn,
      ),
    );
  }
}
/*

    
    




    
*/