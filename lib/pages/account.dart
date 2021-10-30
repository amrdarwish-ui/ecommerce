import 'package:ecommerce/Pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {
  Account({Key key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String email = preferences.getString('email');
    return email;
  }

  emptyPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

  @override
  void initState() {
    super.initState();
  }

  Color primaryColor = Color(0xffE85D5D);
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
                              image:
                                  AssetImage("assets/LoginImages/cart.png"))),
                    ),
                  ),
                ],
                backgroundColor: primaryColor,
                centerTitle: true,
                title: Text(
                  "Account",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              backgroundColor: Colors.transparent,
              body: Center(
                child: Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Container(
                      height: size.height * 0.55,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              height: 100,
                              width: 100,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey[350],
                                child: Icon(
                                  Icons.person_outline_sharp,
                                  color: primaryColor,
                                  size: 70,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Text(
                            "Amr Darwish",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Container(
                            width: size.width * 0.5,
                            height: 100,
                            color: null,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.email_outlined,
                                        color: primaryColor,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                          child: FutureBuilder(
                                        future: getEmail(),
                                        builder: (context, snapshot) {
                                          if (snapshot.data == null) {
                                            return Text("data");
                                          } else {
                                            return Text(
                                              "${snapshot.data}",
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            );
                                          }
                                        },
                                      )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Container(
                              height: size.height * 0.062,
                              width: double.infinity,
                              child: RaisedButton(
                                onPressed: () {
                                  emptyPrefs();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginPage(),
                                      ),
                                      (route) => false);
                                },
                                elevation: 10,
                                color: primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  "Log Out",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              )),
        ));
  }
}
