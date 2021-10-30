import 'package:ecommerce/Serveceis/Api.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'card.dart';

class Details extends StatefulWidget {
  Details(
      {Key key,
      @required this.indexOfTheItem,
      @required this.data,
      @required this.price})
      : super(key: key);
  final int indexOfTheItem;
  final String data;
  final int price;
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Color primaryColor = Color(0xffE85D5D);
  CarouselController buttonCarouselController = CarouselController();
  Api api = Api();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpeg"),
                fit: BoxFit.cover)),
        child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return MySample();
                },
              ));
            },
            label: Text(
              "Buy Now",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            focusColor: primaryColor,
            foregroundColor: Colors.white,
            backgroundColor: primaryColor,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8, top: 5, bottom: 5),
                child: Container(
                  height: double.infinity,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 20),
                            color: Colors.black.withOpacity(.2),
                            blurRadius: 15)
                      ],
                      image: DecorationImage(
                          image: AssetImage("assets/LoginImages/cart.png"))),
                ),
              ),
            ],
            backgroundColor: primaryColor,
            centerTitle: true,
            title: Text(
              "Product Details",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: size.height * 0.35,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  width: double.infinity,
                  child: FutureBuilder(
                    future: api.getImagesLinks(widget.indexOfTheItem),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            valueColor: AlwaysStoppedAnimation(primaryColor),
                          ),
                        );
                      } else {
                        return CarouselSlider.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index, realIndex) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: primaryColor,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              snapshot.data[index]))),
                                ),
                              );
                            },
                            options: CarouselOptions(
                                height: size.height * 0.35,
                                autoPlay: false,
                                enableInfiniteScroll: false,
                                pageSnapping: true));
                      }
                    },
                  ),
                ),
              ),
              Text(
                "${widget.price.toString()} EGP",
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 5,
                  left: 20,
                  right: 20,
                ),
                child: Container(
                  height: size.height * 0.37,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          color: Colors.black.withOpacity(.2),
                          blurRadius: 15),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                        child: Text(
                      widget.data,
                      textAlign: TextAlign.right,
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
