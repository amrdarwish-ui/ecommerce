import 'package:ecommerce/Pages/Details.dart';
import 'package:ecommerce/Serveceis/Api.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color primaryColor = Color(0xffE85D5D);
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
                appBar: AppBar(
                  leading: Container(),
                  elevation: 0,
                  actions: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 8, top: 5, bottom: 5),
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
                                image:
                                    AssetImage("assets/LoginImages/cart.png"))),
                      ),
                    ),
                  ],
                  backgroundColor: primaryColor,
                  centerTitle: true,
                  title: Text(
                    "Store",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                backgroundColor: Colors.transparent,
                body: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: FutureBuilder(
                    future: api.getData(),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            valueColor: AlwaysStoppedAnimation(primaryColor),
                          ),
                        );
                      } else {
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio:
                                      size.width / (size.height * 0.6)),
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return Details(
                                      price: snapshot.data[index].price,
                                      data: snapshot.data[index].description,
                                      indexOfTheItem: index,
                                    );
                                  },
                                ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(10, 0),
                                            color:
                                                Colors.black.withOpacity(0.50),
                                            blurRadius: 50)
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        left: 0,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Container(
                                                height: size.height * 0.14,
                                                width: size.width * 0.30,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            snapshot.data[index]
                                                                .image),
                                                        fit: BoxFit.fill)),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Container(
                                                  child: Text(
                                                snapshot.data[index].name,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ))));
  }
}
