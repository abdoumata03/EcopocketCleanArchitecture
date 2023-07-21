// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/root_screen.dart';
import 'package:ecopocket_clean_architecture/localization/locale_provider.dart';
import 'package:ecopocket_clean_architecture/routing/app_router.dart';
import 'package:ecopocket_clean_architecture/utils/app_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreference.init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final _locale = ref.watch(localeControllerProvider);
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: goRouter,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          debugShowCheckedModeBanner: false,
          locale: _locale,
          theme: ThemeData(textTheme: GoogleFonts.jostTextTheme()),
        );
      },
      child: const RootPage(),
    );
  }
}
