import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news/core/data/hive_helper.dart';
import 'package:news/core/theme/dark_theme.dart';

import 'package:news/core/theme/light_theme.dart';
import 'package:news/core/theme/theme_cubit/theme_cubit.dart';
import 'package:news/features/home_screen/models/cards_model.dart';
import 'package:news/features/mainscreen/bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(CardsModelAdapter());

  await Hive.openBox<CardsModel>('newsBox');
  await Hive.openBox<bool>('themeBox');
  await Hive.openBox<String>('languageBox');

  await HiveHelper().getLanguage();
  await HiveHelper().getNews();



  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: Locale(HiveHelper.language),
        startLocale: Locale(HiveHelper.language),
        child: BlocProvider(
          create: (_)=>ThemeCubit(),
            child: MyApp())
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, theme) {
              return MaterialApp(
                theme: LightTheme.lightTheme,
                darkTheme: DarkTheme.darkTheme,
                themeMode: theme,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                home: AppBottomBar(),
              );
            }
          );
        });
  }
}
