import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/data/hive_helper.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/styles/color.dart';
import '../details_screen/details_screen.dart';
import '../home_screen/models/cards_model.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  saveOrUnSave(int index) async {
    await HiveHelper().deleteNews(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Save".tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: HiveHelper.newsList.length,
            itemBuilder: (context, i) {
              CardsModel data = HiveHelper.newsList[i];
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreen(card: data)));
                },
                child: Container(
                  width: 305.w,
                  height: 310.h,
                  padding:
                      EdgeInsets.only(left: 12.sp, right: 12.sp, top: 12.sp),
                  margin:
                      EdgeInsets.only(right: 10.sp, left: 10.sp, top: 12.sp),
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(25.r)),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 315.w,
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
                          Positioned(
                              top: 12,
                              right: 20,
                              child: Container(
                                width: 35.w,
                                height: 35.h,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12.r)),
                                child: Center(
                                    child: IconButton(
                                        onPressed: () {
                                          saveOrUnSave(i);
                                        },
                                        icon: Icon(
                                          Icons.bookmark,
                                          color: Colors.white,
                                          size: 20.sp,
                                        ))),
                              )),
                        ],
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
                                borderRadius: BorderRadius.circular(20.r)),
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
      ),
    );
  }
}
