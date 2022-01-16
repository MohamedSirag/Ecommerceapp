import 'package:flutter_application_1/helper/apicatprod.dart';
import 'package:flutter_application_1/helper/getcatproduct.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/all.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../constant.dart';
import 'disscreen.dart';

class CatProdScreen extends StatelessWidget {
  String id ;


  CatProdScreen(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
       title: Text("Catogrey",style: TextStyle(color:Colors.black),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        child:

          FutureBuilder(
          future: ApiCatProd().getData(id),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return !snapshot.hasData
            ? const Center(child: CircularProgressIndicator())
            :
        GridView.builder(

          itemCount: snapshot.data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),


          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) {
                  return DisScreen( snapshot.data[index].name,snapshot.data[index].name,snapshot.data[index].avatar,snapshot.data[index].description,snapshot.data[index].price
                  );
                }));},
                child: GridTile(

                  child:Container(
                      height: 50,
                      width: 50,
                      child: Image.network(snapshot.data[index].avatar,fit: BoxFit.cover,)),
                  footer: Container(
                    alignment: Alignment.bottomCenter,
                    color: backcolor,
                    child:

                    Text(snapshot.data[index].name),
                  ),





                )
            );
          },

        );
      },
    )
      ),
    );
  }

  Widget makeCard(
      var title, var body, var avatar, var url, BuildContext context) {
    return GestureDetector(
        onTap: () async {
          //  if (!await launch("$url")) throw 'Could not launch $url';
        },
        child: Container(
          width: 150,
          height: 150,
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 70),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Container(
                  height: 180,
                  width: 250,
                  //  padding: const EdgeInsets.all(4),
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
}
