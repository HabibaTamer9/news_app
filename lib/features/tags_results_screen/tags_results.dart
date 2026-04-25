import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/search/data/get_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/data/api_helper.dart';
import '../../core/styles/color.dart';
import '../details_screen/details_screen.dart';
import '../home_screen/models/cards_model.dart';

class TagsResults extends StatelessWidget {
  const TagsResults({super.key, required this.tag});

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text(tag, style: Theme.of(context).textTheme.headlineMedium),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future:  ApiHelper().hasInternet(GetData.getSearchData(q: tag)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            if (!snapshot.hasData) {
              return const Center(child: Text("No Data",style: TextStyle(fontSize: 20,color: Colors.black),));
            }
            if (snapshot.data!.isEmpty){
              return  Center(child: Text('NoData'.tr(),style: TextStyle(fontSize: 20,color: Colors.black),));
            }
            List list = snapshot.data!;
            return Container(
              margin: EdgeInsets.only(right: 10.w, left: 10.sp),
              width: 375.w,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    CardsModel data = list[i];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailsScreen(card: data)));
                      },
                      child: Container(
                        width: 315.w,
                        height: 310.h,
                        padding: EdgeInsets.only(
                            left: 12.sp, right: 12.sp, top: 12.sp),
                        margin: EdgeInsets.only(
                            right: 10.sp, left: 10.sp, top: 12.sp),
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(25.r)),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 300.w,
                              height: 164.h,
                              child: CachedNetworkImage(
                                imageUrl: data.image,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
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
                              width: 300.w,
                              child: ListTile(
                                leading: Container(
                                  height: 38.h,
                                  width: 38.w,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/profile/Vector2.png"),
                                          fit: BoxFit.cover),
                                      shape: BoxShape.circle),
                                ),
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
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  child: IconButton(
                                    onPressed: (){
                                      Share.share("${data.title}\n${data.url}");
                                    },
                                    icon: Icon(
                                      Icons.share,
                                      color: AppColors.lightIconsColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }),
    );
  }
}
