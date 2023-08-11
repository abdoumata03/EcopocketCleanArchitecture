import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/widgets/applogo_drawer_section.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/widgets/language_drawer_section.dart';
import 'package:ecopocket_clean_architecture/localization/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyDrawer extends ConsumerStatefulWidget {
  const MyDrawer({
    super.key,
  });

  @override
  ConsumerState createState() => _MyDrawerState();
}

class _MyDrawerState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeControllerProvider);
    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppLogoSection(),
              LanguageSection(locale: locale),
            ],
          ),
        ),
      ),
    );
  }
}
