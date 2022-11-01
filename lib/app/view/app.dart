// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:androidker_sneaker/color_schemes.g.dart';
import 'package:androidker_sneaker/home/home.dart';
import 'package:androidker_sneaker/home/view/home_appbar.dart';
import 'package:androidker_sneaker/l10n/l10n.dart';
import 'package:androidker_sneaker/product_details/view/product_details_page.dart';
import 'package:androidker_sneaker/splash/splash.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

class App extends StatelessWidget {
  App({super.key});
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  final _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return Scaffold(
            appBar: HomeAppBar(state: state),
            body: child,
          );
        },
        routes: [
          GoRoute(
            name: 'home',
            path: '/home',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            name: 'product_details',
            path: '/product/:id',
            builder: (context, state) {
              return ProductDetailsPage(id: state.params['id']!);
            },
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: FlexThemeData.light(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: FlexThemeData.dark(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
