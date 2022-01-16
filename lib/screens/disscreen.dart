import 'package:flutter_application_1/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DisScreen extends StatelessWidget {
  String id;
  var name;
  String avatar;
  String description;
  String price;

  DisScreen(this.id, this.name, this.avatar, this.description, this.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // title: Text("Catogrey",style: TextStyle(color:Colors.black),),
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
                Icons.share,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "$name",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.topLeft,
                child: Text(
                  "Newly add item ",
                  style: TextStyle(fontSize: 15, color: btnColor),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Container(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 20,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "$avatar"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Container(
                          child: Card(
                              child: Container(
                        child: Row(
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
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text("Wish list"),
                            ),
                          ],
                        ),
                      ))),
                    ),
                    GestureDetector(
                      child: Container(
                          child: Card(
                              child: Container(
                        child: Row(
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.add_shopping_cart_rounded,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  //  Share.share('check out our news app $url');
                                }),
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text("Add to cart"),
                            ),
                          ],
                        ),
                      ))),
                    ),
                    GestureDetector(
                      child: Container(
                          child: Card(
                              child: Container(
                        child: Row(
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.qr_code,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  //  Share.share('check out our news app $url');
                                }),
                          ],
                        ),
                      ))),
                    ),
                  ])),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            alignment: Alignment.center,
            child: Text(
              "$description",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Center(
              //padding: EdgeInsets.only(left: 20),
              child: RatingBar.builder(
                  initialRating: 3,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Icon(
                          Icons.sentiment_very_dissatisfied,
                          color: Colors.red,
                        );
                      case 1:
                        return Icon(
                          Icons.sentiment_dissatisfied,
                          color: Colors.redAccent,
                        );
                      case 2:
                        return Icon(
                          Icons.sentiment_neutral,
                          color: Colors.amber,
                        );
                      case 3:
                        return Icon(
                          Icons.sentiment_satisfied,
                          color: Colors.lightGreen,
                        );
                      case 4:
                        return Icon(
                          Icons.sentiment_very_satisfied,
                          color: Colors.green,
                        );
                      default:
                        return Icon(
                          Icons.sentiment_very_dissatisfied,
                          color: Colors.red,
                        );
                    }
                  },
                  onRatingUpdate: (rating) {
                    print(rating);
                  })),
          SizedBox(
              width: 200.0,
              height: 100.0
          ),
        ],
      ),
      floatingActionButton: Container(
          width: MediaQuery.of(context).size.width - 30,
          child: Container(
            child: Card(
              color: btnColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "$price \$ Buy now !",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                        child: Card(
                            child: Container(
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            child: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 24.0,
                                  color: btnColor,
                                ),
                                onPressed: () {
                                  //  Share.share('check out our news app $url');
                                }),
                          ),
                        ],
                      ),
                    ))),
                  ),
                ],
              ),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
