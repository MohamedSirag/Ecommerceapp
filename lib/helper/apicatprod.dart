import 'dart:convert';

import 'package:flutter_application_1/model/itemmodel.dart';
import 'package:http/http.dart'as http;

class ApiCatProd {




   getData(var idd) async {
    var url=Uri.parse("https://retail.amit-learning.com/api/categories/"+idd);

    List<ItemModel> itmesList = [];
    var response = await http.get(url);
    var resBody = jsonDecode(response.body)["products"];
    for (var x in resBody) {
      itmesList.add(ItemModel(
          "${x["id"]}", "${x["name"]}","${x["avatar"]}","${x["description"]}","${x["price"]}" ));
    }
    return itmesList;
  }

}