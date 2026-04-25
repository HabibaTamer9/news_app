import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/styles/color.dart';
import 'package:news/features/tags_results_screen/tags_results.dart';

class SearchContainer extends StatelessWidget {
  SearchContainer({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h, left: 30.w, right: 30.w),
      width: 315.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10.w),
            height: 50.h,
            width: 250.w,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              maxLines: 1,
              controller: controller,
              decoration: InputDecoration(
                hintText:"   ${'Search'.tr()}",
                hintStyle: Theme.of(context).textTheme.bodySmall,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).cardColor)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).cardColor)),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TagsResults(tag: controller.text)));
            },
            child: Container(
              width: 48.w,
              height: 50.h,
              decoration: BoxDecoration(
                  color: AppColors.lightIconsColor,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
