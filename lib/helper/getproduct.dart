import 'dart:convert';

import 'package:flutter_application_1/model/itemmodel.dart';
import 'package:flutter_application_1/model/productModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;
final GetProductdata=ChangeNotifierProvider<GetProduct>((ref)=> GetProduct());
class GetProduct extends ChangeNotifier {
  List<ItemModel>listDataModel=[];
  GetProduct(){
    print("ana hona");
    getData();

  }

  Future getData()async{
    listDataModel=[];
    try{

      var url=Uri.parse("https://retail.amit-learning.com/api/products");
      //print(url);
      var response=await http.get(url);
      var resposebody=jsonDecode(response.body)["products"];
     // print(resposebody.length);
      for(var x in resposebody){
        listDataModel.add(ItemModel(
            "${x["id"]}", "${x["name"]}","${x["avatar"]}","${x["description"]}","${x["price"]}"        ));
      }
    }catch(e){
      print("e==>$e");
    }
    notifyListeners();

  }

}