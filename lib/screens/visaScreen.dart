import 'package:credit_card_input_form/credit_card_input_form.dart';
import 'package:flutter/material.dart';

class VisaScreen extends StatefulWidget {
  const VisaScreen({Key key}) : super(key: key);

  @override
  _VisaScreenState createState() => _VisaScreenState();
}

class _VisaScreenState extends State<VisaScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_outlined),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Container(
              child: CreditCardInputForm(
                cardHeight: 170,
                showResetButton: true,
                onStateChange: (currentState, cardInfo) {
                  print(currentState);
                  print(cardInfo);
                },
                initialAutoFocus: true, // optional
              ),
            )));
  }
}
