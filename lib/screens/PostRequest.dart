//Mohamed Sirag
import 'dart:developer';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job offer',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job offer - post api'),
      ),
      body: Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new RaisedButton(
              onPressed: () async {
                var req = await createAirLine("12", "Sri Lankan Airways", "Sri Lanka", "https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/Qatar_Airways_Logo.svg/sri_lanka.png", "From Sri Lanka", "Katunayake, Sri Lanka", "www.srilankaairways.com", "1990");
                // _showToast(context, "Your data was sent !");
                _showToast(context, json.decode(req.body));
                log(json.decode(req.body).toString());
              },
              child: const Text('send request !'),
            ),
          ],
        ),
      ),
    );
  }

  void _showToast(BuildContext context, var textIn) {
    final scaffold = ScaffoldMessenger.of(context);

    scaffold.showSnackBar(
      SnackBar(
        content: new Text(textIn.toString()),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  Future<http.Response> createAirLine(
    String id,
    String name,
    String country,
    String logo,
    String slogan,
    String head_quaters,
    String website,
    String established,
  ) {
    return http.post(
      Uri.parse('https://api.instantwebtools.net/v1/airlines'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': id,
        'name': name,
        'country': country,
        'logo': logo,
        'slogan': slogan,
        'head_quaters': head_quaters,
        'website': website,
        'established': established,
      }),
    );
  }
}
