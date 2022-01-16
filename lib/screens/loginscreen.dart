import 'package:flutter_application_1/constant.dart';
import 'package:flutter_application_1/helper/loginhelper.dart';
import 'package:flutter_application_1/screens/signupscreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen() : super();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/5),
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
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Email',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
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
                          child: Container(child: Text('Login'),),
                        ),
                        onPressed: () async {
                          print(await LoginHelper().postLogin(emailController.text,passwordController.text,context));
                          //print(passwordController.text);

                        },
                      )),
                  Container(
                      child: Row(
                        children: <Widget>[
                          Text('Does not have account?'),
                          FlatButton(
                            textColor: Colors.blue,
                            child: Text(
                              'Sign up',
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              //signup screen
                              Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context) {
                                return SignUpScreen();
                              }));
                            },
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ))
                ],
              ))),
    );
  }
}
