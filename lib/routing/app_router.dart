import 'package:ecopocket_clean_architecture/features/transactions/domain/model/category_info.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/add_transaction/add_transaction.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/all_transactions/all_transactions.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/category_transactions.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

enum AppRoute {
  home,
  cateogryTransactions,
  newTransaction,
  allTransactions,
}

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(initialLocation: '/home', routes: [
    GoRoute(
      path: '/home',
      name: AppRoute.home.name,
      pageBuilder: (context, state) =>
          const MaterialPage(fullscreenDialog: true, child: RootPage()),
    ),
    GoRoute(
        path: '/category_transactions',
        name: AppRoute.cateogryTransactions.name,
        pageBuilder: (context, state) {
          CategoryInfo categoryInfo = state.extra as CategoryInfo;
          return MaterialPage(
              fullscreenDialog: true,
              child: CategoryTransactions(
                period: state.queryParameters['period']!,
                category: categoryInfo,
              ));
        }),
    GoRoute(
      path: '/new_transaction/:type',
      name: AppRoute.newTransaction.name,
      pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: NewTransaction(
            type: state.pathParameters['type']!,
          ),
          transitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curveAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            );

            final offsetAnimation = Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(curveAnimation);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          }),
    ),
    GoRoute(
      path: '/all_transactions',
      name: AppRoute.allTransactions.name,
      pageBuilder: (context, state) => const MaterialPage(
        fullscreenDialog: true,
        child: AllTransactions(),
      ),
    ),
  ]);
}
