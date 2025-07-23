import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:playstation_store/presentation/add_device/add_device.dart';
import 'package:playstation_store/presentation/home_screen/home_screen.dart';
import 'package:playstation_store/presentation/login_screen/login_screen.dart';
import 'package:playstation_store/router/app_router.dart';

// ... باقي الشاشات

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: appNavigatorKey,
  initialLocation: AppRoutes.signInScreen,
  routes: [
    GoRoute(
      path: AppRoutes.signInScreen,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.homeScreen,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.addDevice,
      builder: (context, state) => AddDevice(),
    ),
  ],
);
