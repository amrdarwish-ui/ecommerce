import 'package:ecommerce/Pages/SignUpPage.dart';
import 'package:ecommerce/Pages/bottom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  static String email;
  static String password;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscure = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Color primaryColor = Color(0xffE85D5D);

  ///
  void setSharedprefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('email', emailController.text);
  }

  ///
  void getSharedPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String email = preferences.getString('email');
    if (email != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return BottomTabBar();
        },
      ));
    }
  }

  ///
  @override
  void initState() {
    getSharedPrefs();
    super.initState();
  }

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
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 10),
                              color: Colors.black.withOpacity(.2),
                              blurRadius: 15)
                        ],
                        image: DecorationImage(
                            image: AssetImage("assets/LoginImages/cart.png"))),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: size.height * 0.63,
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
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "SIGN IN",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: size.height * .03,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Email or Username requird';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'Username or Email',
                                      hintStyle: TextStyle(color: primaryColor),
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: primaryColor,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                              color:
                                                  Colors.black.withAlpha(100))),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide:
                                              BorderSide(color: primaryColor)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide:
                                              BorderSide(color: primaryColor))),
                                ),
                              ),
                              SizedBox(
                                height: size.height * .03,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: TextFormField(
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: obscure,
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'password requird';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: TextStyle(color: primaryColor),
                                      prefixIcon: Icon(
                                        Icons.shield,
                                        color: primaryColor,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.remove_red_eye_outlined,
                                          color: Colors.black.withAlpha(100),
                                        ),
                                        onPressed: () {
                                          if (obscure) {
                                            setState(() {
                                              obscure = false;
                                            });
                                          } else {
                                            setState(() {
                                              obscure = true;
                                            });
                                          }
                                        },
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                              color:
                                                  Colors.black.withAlpha(100))),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide:
                                              BorderSide(color: primaryColor)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide:
                                              BorderSide(color: primaryColor))),
                                ),
                              ),
                              SizedBox(
                                height: size.height * .04,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 50, right: 50),
                                child: LoginButton(
                                  size: size,
                                  formKey: formKey,
                                  primaryColor: primaryColor,
                                  emailController: emailController,
                                  passController: passwordController,
                                ),
                              ),
                              SizedBox(
                                height: size.height * .03,
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    "Don't have an account? ",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return SignUpPage();
                                        },
                                      ));
                                    },
                                    child: Text(
                                      "Sign up",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              SizedBox(
                                height: size.height * .02,
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      height: 1,
                                      width: size.width * 0.2,
                                      decoration:
                                          BoxDecoration(color: Colors.black),
                                    ),
                                    Text("or Sign in with"),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      height: 1,
                                      width: size.width * 0.2,
                                      decoration:
                                          BoxDecoration(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height * .03,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Image.asset(
                                      "assets/LoginImages/facebook.png",
                                      height: 40,
                                      width: 40,
                                    ),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Image.asset(
                                      "assets/LoginImages/google.png",
                                      height: 28,
                                      width: 28,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton(
      {Key key,
      @required this.size,
      @required this.formKey,
      @required this.primaryColor,
      @required this.emailController,
      @required this.passController})
      : super(key: key);

  final Size size;
  final GlobalKey<FormState> formKey;
  final Color primaryColor;
  final TextEditingController emailController;
  final TextEditingController passController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.062,
      width: double.infinity,
      child: RaisedButton(
        onPressed: () async {
          if (formKey.currentState.validate()) {
            ///thype your code here
            LoginPage.email = emailController.text;
            LoginPage.password = passController.text;
            {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              preferences.setString('email', emailController.text);
            }
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return BottomTabBar();
              },
            ));
          } else {}
        },
        elevation: 10,
        color: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text(
          "Sign in",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
