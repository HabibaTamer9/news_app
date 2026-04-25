import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/tags_results_screen/tags_results.dart';

class Tags extends StatelessWidget {
  Tags({super.key});

  List headers =['Health'.tr() , 'Music'.tr() , 'Technology'.tr() , 'Sports'.tr()];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 15.h,horizontal: 25.w),
        width: 375.w,
        height: 20.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: headers.length,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TagsResults(tag: headers[i])));
                },
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 19.w),
                    child: Text(
                      "#${headers[i]}",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.w500),
                    )),
              );
            }));
  }
}
