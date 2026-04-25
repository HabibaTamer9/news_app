import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/styles/color.dart';

import '../../../core/data/api_helper.dart';
import '../../details_screen/details_screen.dart';
import '../models/cards_model.dart';
import '../services/get_api.dart';
class SmallCard extends StatelessWidget {
  const SmallCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(future:  ApiHelper().hasInternet(GetAPI.getTopHeadLines()), builder: (context , snapshot){
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
            child: CircularProgressIndicator());
      }
      if (snapshot.hasError) {
        return Center(child: Text(snapshot.error.toString()));
      }
      if (!snapshot.hasData) {
        return const Center(child: Text("No Data"));
      }
      List list = snapshot.data!;
        return Container(
          margin: EdgeInsets.only(right: 10.w,left: 10.sp),
          height: 90.h,
          width: 375.w,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, i) {
                CardsModel data = list[i];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(card: data)));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 10.w,left: 10.sp),

                    width: 205.w,
                    height: 88.h,
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(25.r)),
                    child: Row(children: [
                      Container(
                        width: 70.sp,
                        height: 70.sp,
                        margin: EdgeInsets.all(9.sp),

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
                                child: CircularProgressIndicator(color: AppColors.lightIconsColor,),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(25.h),
                              ),
                              child: const Center(
                                child: Icon(Icons.image_not_supported, color: Colors.red),
                              ),
                            ),
                          ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 14.0.sp),
                          child: Column(
                            children: [
                              Text(
                                data.title,
                                style: Theme.of(context).textTheme.bodyMedium,
                                maxLines: 2,
                              ),
                              SizedBox(
                                height: 9.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.visibility_outlined,
                                    color: Color(0xFF9397A0),
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    "44.999",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontWeight: FontWeight.w500),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                );
              }),
        );
      }
    );
  }
}
