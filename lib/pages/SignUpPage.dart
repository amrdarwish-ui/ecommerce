import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool obscure = true;
  final formKey = GlobalKey<FormState>();
  Color primaryColor = Color(0xffE85D5D);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
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
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: size.height * 0.67,
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
                                  "SIGN UP",
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
                                  keyboardType: TextInputType.name,
                                  controller: nameController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Name requird';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'Name',
                                      hintStyle: TextStyle(color: primaryColor),
                                      prefixIcon: Icon(
                                        Icons.person_outline,
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
                                height: size.height * .03,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: TextFormField(
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: obscure,
                                  controller: confirmPasswordController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'password requird';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'Confirm Password',
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
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                child: Container(
                                  height: size.height * 0.062,
                                  width: double.infinity,
                                  child: RaisedButton(
                                    onPressed: () {
                                      if (formKey.currentState.validate()) {
                                        //type your code here
                                      }
                                    },
                                    elevation: 10,
                                    color: primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * .02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Have an account? ",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Sign in",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
