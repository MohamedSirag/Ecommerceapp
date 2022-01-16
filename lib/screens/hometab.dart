import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter_application_1/helper/apicatprod.dart';
import 'package:flutter_application_1/helper/getcat.dart';
import 'package:flutter_application_1/helper/getcatproduct.dart';
import 'package:flutter_application_1/helper/getproduct.dart';
import 'package:flutter_application_1/screens/disscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

import '../constant.dart';
import 'catprodscreen.dart';

class HomeTab extends StatefulWidget {
  const HomeTab() : super();

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.white, backcolor])),
      child: Scaffold(
          // By defaut, Scaffold background is white
          // Set its value to transparent
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                ),
              )
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(0),
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Shop",
                      style: TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
                    Text("Get your everyday goods !",
                        style: TextStyle(fontSize: 30))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0, right: 10, left: 10),

                /// In AnimSearchBar widget, the width, textController, onSuffixTap are required properties.
                /// You have also control over the suffixIcon, prefixIcon, helpText and animationDurationInMilli
                child: AnimSearchBar(
                  width: 400,
                  //  textController: textController,
                  onSuffixTap: () {
                    //   setState(() {textController.clear();});
                  },
                  textController: searchController,
                ),
              ),

              Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: Text(
                    "Newest Offers",
                    style: TextStyle(fontSize: 20),
                  )),

              // products list start
              Consumer(
                builder: (context, watch, child) {
                  final viewmodeltoprate = watch(GetProductdata);

                  return Container(
                    height: 280,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: viewmodeltoprate.listDataModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        //  print("$index");
                        // print("Screen name : home "+"${viewmodeltoprate.listDataModel[index].toString()}");
                        return makeCard(
                            viewmodeltoprate.listDataModel[index].name,
                            viewmodeltoprate.listDataModel[index].name,
                            viewmodeltoprate.listDataModel[index].avatar,
                            viewmodeltoprate.listDataModel[index].name,
                            viewmodeltoprate.listDataModel[index].description,
                            viewmodeltoprate.listDataModel[index].price,
                            context);
                      },
                    ),
                  );
                },
              ),
              // products list end
              Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: const Text(
                    "Explore by category ",
                    style: TextStyle(fontSize: 20),
                  )),
              Consumer(
                builder: (context, watch, child) {
                  final viewmodeltoprate = watch(GetCartdata);

                  return Container(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: viewmodeltoprate.listDataModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        // print("$index");
                        // print("Screen name : home "+"${viewmodeltoprate.listDataModel[index].toString()}");
                        return makeCardCat(
                            viewmodeltoprate.listDataModel[index].name,
                            viewmodeltoprate.listDataModel[index].id,
                            viewmodeltoprate.listDataModel[index].avatar,
                            viewmodeltoprate.listDataModel[index].name,
                            context);
                      },
                    ),
                  );
                },
              )
            ],
          )),
    );
  }

  Widget makeCard(var title, var body, var avatar, var url, var dis, var price,
      BuildContext context) {
    return GestureDetector(
        onTap: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return DisScreen(title, title, avatar, dis, price);
          }));
        },
        child: Container(
          width: 150,
          height: 140,
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Container(
                  height: 170,
                  width: 250,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage((avatar
                                    .toString()
                                    .contains("null") ||
                                avatar.toString().contains("!")
                            ? "https://dkhlak.com/wp-content/uploads/2017/12/23812-f3.jpg"
                            : avatar.toString())),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 35,
                  width: MediaQuery.of(context).size.width - 10,
                  padding: EdgeInsets.all(1),
                  child: Text(
                    "$title[name]",
                    textAlign: TextAlign.right,
                  ),
                ),
                Container(
                    //padding: EdgeInsets.only(left: 60),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: btnColor,
                            size: 24.0,
                          ),
                          onPressed: () {
                            //  Share.share('check out our news app $url');
                          }),
                      IconButton(
                          icon: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.black,
                            size: 24.0,
                          ),
                          onPressed: () {
                            //  Share.share('check out our news app $url');
                          }),
                    ])),

                // Text("$body"),
              ],
            ),
          ),
        ));
  }

  Widget makeCardCat(
      var title, var body, var avatar, var url, BuildContext context) {
    return GestureDetector(
        onTap: () async {
          var item = ApiCatProd().getData(body);
          //      print(GetCatProduct.id_cat);
          //  if (!await launch("$url")) throw 'Could not launch $url';
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return CatProdScreen("$body");
          }));
        },
        child: Container(
          width: 150,
          height: 120,
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 6,
                  width: 250,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage((avatar
                                    .toString()
                                    .contains("null") ||
                                avatar.toString().contains("!")
                            ? "https://dkhlak.com/wp-content/uploads/2017/12/23812-f3.jpg"
                            : avatar.toString())),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 35,
                  width: MediaQuery.of(context).size.width - 10,
                  padding: EdgeInsets.all(1),
                  child: Text(
                    "$title",
                    textAlign: TextAlign.right,
                  ),
                ),

                // Text("$body"),
              ],
            ),
          ),
        ));
  }
}
