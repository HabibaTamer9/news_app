import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/home_screen/models/cards_model.dart';

import '../../../core/styles/color.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key, required this.data});
  final CardsModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8.sp, right: 8.sp, top: 12.sp),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(25.r)),
      child: Column(
        children: [
          SizedBox(
            height: 140.h,
            child: CachedNetworkImage(
              imageUrl: data.image,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(25.h),
                ),
              ),
              placeholder: (context, url) => Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.lightIconsColor,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(25.h),
                ),
                child: const Center(
                  child: Icon(Icons.error, color: Colors.red),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.sp),
            child: Text(
              data.title,
              style: Theme.of(context).textTheme.titleSmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 231.w,
            child: ListTile(

              title: Text(
                data.authorName,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                data.date,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              trailing: Container(
                height: 37.h,
                width: 37.w,
                decoration: BoxDecoration(
                    color: AppColors.lightIconContainerColor,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Icon(
                  Icons.share,
                  color: AppColors.lightIconsColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
