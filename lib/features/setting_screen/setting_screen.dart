import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/const/language.dart';
import 'package:news/core/data/hive_helper.dart';
import 'package:news/core/data/lists.dart';
import 'package:switchy/switchy.dart';

import '../../core/theme/theme_cubit/theme_cubit.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool visible = false;
  bool visible2 = false;
  bool darkMode = HiveHelper.theme;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings".tr(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                visible = !visible;
                setState(() {});
              },
              leading: Icon(Icons.language , color: Theme.of(context).iconTheme.color),
              title: Text('Language'.tr(), style: Theme.of(context).textTheme.titleSmall),
              trailing: Icon(visible
                  ? Icons.keyboard_arrow_down
                  : Icons.arrow_forward_ios , color: Theme.of(context).iconTheme.color),
            ),
            visible
                ? Column(
                    children: [
                      ListTile(
                        onTap: () {
                          context.setLocale(Locale("en"));
                          language = "en";
                          AppLists.smallCardList.clear();
                          AppLists.homeCardList.clear();
                          setState(() {});
                        },
                        title: Text("English", style: Theme.of(context).textTheme.titleSmall),
                        trailing: language == "en"
                            ? Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            : null,
                      ),
                      ListTile(
                        onTap: () {
                          context.setLocale(Locale("ar"));
                          language = "ar";
                          AppLists.smallCardList.clear();
                          AppLists.homeCardList.clear();
                          setState(() {});
                        },
                        title: Text("العربيه", style: Theme.of(context).textTheme.titleSmall),
                        trailing: language == "ar"
                            ? Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            : null,
                      ),
                    ],
                  )
                : SizedBox.shrink(),
            ListTile(
              onTap: () {
                setState(() {
                  visible2 = !visible2;
                });
              },
              leading: Icon(darkMode?Icons.dark_mode: Icons.light_mode , color: Theme.of(context).iconTheme.color),
              title: Text('Theme'.tr(), style: Theme.of(context).textTheme.titleSmall),
              trailing: Icon(visible
                  ? Icons.keyboard_arrow_down
                  : Icons.arrow_forward_ios, color: Theme.of(context).iconTheme.color),
            ),
            visible2
                ? ListTile(
                    title: Text(darkMode? "Dark Mode".tr() :"Light Mode".tr() , style: Theme.of(context).textTheme.titleSmall),
                    trailing: Switchy(
                      value: darkMode,
                      onChanged: (v) {context.read<ThemeCubit>().toggleTheme();
                        HiveHelper().changeTheme(v);
                        setState(() {
                            darkMode = HiveHelper.theme;
                          });
                      },
                      activeIcon: Icons.nightlight_round,
                      inactiveIcon: Icons.wb_sunny,
                      activeColors: [Color(0xFF2C3E50), Color(0xFF34495E)],
                      inactiveColors: [Color(0xFFF39C12), Color(0xFFE67E22)],
                    ))
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
