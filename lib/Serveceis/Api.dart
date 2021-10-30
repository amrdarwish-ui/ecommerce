import 'dart:async';
import 'dart:convert';
import 'package:ecommerce/Models/Product.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<Product>> getData() async {
    var url = "https://student.valuxapps.com/api/products";
    var response = await http.get(url);
    var responsebody = json.decode(response.body)["data"]["data"];
    List<Product> list = [];
    for (var i in responsebody) {
      Product product = Product(
          id: i["id"],
          price: i["price"],
          image: i["image"],
          name: i["name"],
          description: i["description"],
          images: i["images"]);
      list.add(product);
      print(product.id);
    }

    return list;
  }

  Future<List> getImagesLinks(int index) async {
    var url = "https://student.valuxapps.com/api/products";
    var response = await http.get(url);
    var responsebody =
        json.decode(response.body)["data"]["data"][index]["images"];
    List list = [];
    for (var i in responsebody) {
      list.add(i);
      print(i);
    }
    return list;
  }
}
