import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/visaScreen.dart';

import '../constant.dart';

class CartScreen extends StatelessWidget {
  const CartScreen() : super();

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
                    "My Cart:",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Card(
                      child: Container(
                        color: Colors.grey.shade100,
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width,
                        child: ListTile(
                          title: Text("hi "),
                          leading: Image.network(
                              "https://www.creditcardvalidator.org/img/visa.png"),
                          trailing: Image.network(
                              "https://www.creditcardvalidator.org/img/visa.png"),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return VisaScreen();
          }));
        },
        child: Container(
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
                        "Finish buying!",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return VisaScreen();
                        }));
                      },
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
                                    Icons.check,
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
