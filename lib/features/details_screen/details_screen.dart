import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/const/size.dart';
import 'package:news/core/data/hive_helper.dart';
import 'package:news/core/styles/color.dart';
import 'package:news/features/details_screen/data/details_api.dart';
import 'package:share_plus/share_plus.dart';

import '../home_screen/models/cards_model.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.card});

  final CardsModel card;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String content = "";
  bool isSaved = false;
  int index = 0;
  String error = "";

  isSavedFunc() {
    final list = HiveHelper.newsList;

    setState(() {
      isSaved = list.any((item) =>
      item.title == widget.card.title && item.url == widget.card.url);

      if (isSaved) {
        index = list.indexWhere(
              (item) => item.title == widget.card.title && item.url == widget.card.url,
        );
      }
    });
  }
  saveOrUnSave(int index) async {
    if(isSaved) {
      await HiveHelper().deleteNews(index);
      setState(() {
        isSaved = false;
      });
    }else{
      await HiveHelper().addNews(newsCard: widget.card);
      setState(() {
        isSaved = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Saved".tr()),));
    }
  }
  internet()async{
    try{
      final result = await InternetAddress.lookup('google.com');

      bool hasNet =
          result.isNotEmpty && result[0].rawAddress.isNotEmpty;

      if (!hasNet) {
        error ="No Internet Connection";
      }
      getContent();

      setState(() {});
    } on SocketException{
      error = "No Internet Connection";
      setState(() {});
    }catch(e){
      error = e.toString();
      setState(() {});
    }
    setState(() {});
  }
  getContent() async{
    content = await DetailsAPI().getFullContent(widget.card.url);
    setState(() {});
  }
  @override
  void initState() {
    isSavedFunc();
    internet();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(error.isNotEmpty){
      return Scaffold(
        body:Center(child: Text(error, style: Theme.of(context).textTheme.titleLarge,)),
      );
    }else{
    return Scaffold(
      body: SizedBox(
        height: AppSize.height,
        child: Stack(
          children: [
            SizedBox(
              width: AppSize.width,
              height: AppSize.height * 0.6,
              child: Image.network(
                widget.card.image,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                top: 40,
                left: 30,
                child: Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Center(
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 20.sp,
                          ))),
                )),
            Positioned(
                top: 40,
                right: 30,
                child: Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Center(
                      child: IconButton(
                          onPressed: (){
                            saveOrUnSave(0);
                          },
                          icon: Icon(
                            isSaved ?Icons.bookmark : Icons.bookmark_border,
                            color: Colors.white,
                            size: 25.sp,
                          ))),
                )),
            DraggableScrollableSheet(
              initialChildSize: 0.58,
              minChildSize: 0.58,
              maxChildSize: 0.89,
              builder: (context, controller) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(50.r)),
                  child: ListView(
                    controller: controller,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20.h),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          widget.card.title,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      Container(
                        height: 54.h,
                        padding: EdgeInsets.symmetric(horizontal: 14.sp),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffEEEEEE),
                          ),
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 26.h,
                              width: 26.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/profile/Vector2.png"),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle),
                            ),
                            SizedBox(
                              width: 13.w,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: AppSize.width * 0.33,
                              ),
                              child: Text(
                                "${widget.card.authorName} ",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(fontSize: 13.sp)
                              ),
                            ),
                            Text(widget.card.date, style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 13.sp),),
                            Spacer(),
                            Container(
                              height: 37.h,
                              width: 37.w,
                              decoration: BoxDecoration(
                                  color: AppColors.lightIconContainerColor,
                                  borderRadius:
                                  BorderRadius.circular(20.r)),
                              child: IconButton(
                                onPressed: (){
                                  Share.share("${widget.card.title}\n${widget.card.url}");
                                },
                                icon: Icon(
                                  Icons.share,
                                  color: AppColors.lightIconsColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      Text(content, style: Theme.of(context).textTheme.bodyLarge,)
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }}
}
