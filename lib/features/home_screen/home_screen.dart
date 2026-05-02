import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/const/language.dart';
import 'package:news/features/home_screen/widgets/home_card.dart';
import 'package:news/features/home_screen/widgets/search_container.dart';
import 'package:news/features/home_screen/widgets/small_card.dart';
import 'package:news/features/home_screen/widgets/tags.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat(
        'EEEE, d MMMM yyyy',
        language
    ).format(DateTime.now());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 62.h),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Row(children: [
                  Container(
                    width: 49.w,
                    height: 49.h,
                    margin: EdgeInsets.symmetric(horizontal: 19.w),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/profile/Vector.png"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(25.r)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'welcome Back'.tr(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        formattedDate,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ])),
            SearchContainer(),
            Tags(),
            HomeCard(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 30.sp),
              child: Text(
                'shorts'.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SmallCard()
          ]),
        ),
      ),
    );
  }
}
