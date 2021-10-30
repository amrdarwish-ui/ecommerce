import 'package:flutter/material.dart';

class Product {
  int id;
  num price;
  String image;
  String name;
  String description;
  var images;
  Product({
    @required this.id,
    @required this.price,
    @required this.image,
    @required this.name,
    @required this.description,
    @required this.images,
  });
}
