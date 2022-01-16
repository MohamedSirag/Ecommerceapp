import 'package:flutter_application_1/helper/signuphelper.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen() : super();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white,backcolor])),
      child: Scaffold(
        // By defaut, Scaffold background is white
        // Set its value to transparent
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Container(
              height: double
                  .infinity,
              width: double
                  .infinity,
              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/9),
              child: Column(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child:
                      Container (
                        height: 100,
                        width: 100,
                        padding: EdgeInsets.all(5),
                        child: Image.asset(
                            "assets/images/icon.png"),
                      )

                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      //obscureText: true,
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'name',
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller:
                      passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'password',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                     // obscureText: true,
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height/8,

                      padding: EdgeInsets.all(20),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: btnColor,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Container(child: Text('Sign up !'),),
                        ),
                        onPressed: () async {
                         print( await SignUpHelper().postSign(nameController.text,emailController.text,passwordController.text,context));
                          //print(passwordController.text);

                        },
                      )),

                ],
              ))),
    );
  }
}
