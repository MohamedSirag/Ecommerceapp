import 'dart:convert';
import 'package:flutter_application_1/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpHelper {
   postSign(
      String name,
      String email,
      String password, BuildContext context,
      ) async {
    print(email);
    var url= Uri.parse('https://retail.amit-learning.com/api/register');
    var response = await http.post(url,
        body: {
          "name": "$name",
          "email": "$email",
          "password": "$password"
        }
    );
    print(response);

    var resBody = jsonDecode(response.body);
    if (resBody.toString().contains("Un Authorised")){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Wrong Data"),
      ));
    }else{
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context) {
        return HomeScreen();
      }));
    }
    return resBody;
  }
}
