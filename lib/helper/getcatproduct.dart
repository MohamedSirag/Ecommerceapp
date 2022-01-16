import 'dart:convert';

import 'package:flutter_application_1/model/itemmodel.dart';
import 'package:flutter_application_1/model/productModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;

final GetCatProductdata=ChangeNotifierProvider<GetCatProduct>((ref)=> GetCatProduct());



class GetCatProduct extends ChangeNotifier {
  static var id_cat ;
  List<ItemModel>listDataModel=[];
  GetCatProduct(){
    listDataModel=[];
    //print("ana hona -> GetCatProductdata");
    //print("$id_cat");
    getData();

  }

  Future getData()async{
    listDataModel=[];
    try{

      var url=Uri.parse("https://retail.amit-learning.com/api/categories/"+id_cat);
      //print(url);
      var response=await http.get(url);
      var resposebody=jsonDecode(response.body)["products"];
      // print(resposebody.length);
      for(var x in resposebody){
        listDataModel.add(ItemModel(
            "${x["id"]}", "${x["name"]}","${x["avatar"]}","${x["description"]}","${x["price"]}"
        ));
      }
    }catch(e){
      print("e==>$e");
    }
    notifyListeners();

  }

}