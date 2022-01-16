
import 'dart:convert';

import 'package:flutter_application_1/model/catmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;

final GetCartdata=ChangeNotifierProvider<GetCart>((ref)=> GetCart());
class GetCart extends ChangeNotifier {
  List<catModel>listDataModel=[];
  GetCart(){
    print("ana hona");
    getData();

  }

  Future getData()async{
    listDataModel=[];
    try{

      var url=Uri.parse("https://retail.amit-learning.com/api/categories");
      //print(url);
      var response=await http.get(url);
      var resposebody=jsonDecode(response.body)["categories"];
      // print(resposebody.length);
      for(var x in resposebody){
        listDataModel.add(catModel(
            "${x["id"]}", "${x["name"]}","${x["avatar"]}"
        ));
      }
    }catch(e){
      print("e==>$e");
    }
    notifyListeners();

  }

}