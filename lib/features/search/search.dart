import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/details_screen/details_screen.dart';
import 'package:news/features/home_screen/models/cards_model.dart';
import 'package:news/features/search/data/get_data.dart';
import 'package:news/features/search/widgets/search_card.dart';


class Search extends SearchDelegate {

  late List result;


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (result.isEmpty) {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "🔍",
          style: TextStyle(fontSize: 35),
        ),
        Text(
          "No results",
          style: TextStyle(color: Colors.black, fontSize: 25),
        )
      ]);
    } else {
      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 300.h),
          itemCount: result.length,
          itemBuilder: (context, i) {
            CardsModel data = result[i];
            return GestureDetector(
              onTap: ()  {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsScreen(card: data)));
              },
              child:SearchCard(data: data),
            );
          });
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty || query.length < 3) {
      return Center(
        child: Text(
          "Type at least 3 characters",
          style: TextStyle(fontSize: 18),
        ),
      );
    }
    return FutureBuilder(
        future: GetData.getSearchData(q: query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
                  "Field loading data ${snapshot.error}",
                  style: TextStyle(color: Colors.black),
                ));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "🔍",
                        style: TextStyle(fontSize: 35),
                      ),
                      Text(
                        "No results",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      )
                    ]));
          } else {

            result = snapshot.data as List;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.h,
                      crossAxisSpacing: 10.w,
                      mainAxisExtent: 300.h),
                  itemCount: result.length,
                  itemBuilder: (context, i) {
                    CardsModel data = result[i];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>DetailsScreen(card: data)));
                      },
                      child: SearchCard(data: data)
                    );
                  }),
            );
          }
        });
  }
}