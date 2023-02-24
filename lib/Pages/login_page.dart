import 'package:flutter/material.dart';
import 'package:flutter_catlog/Pages/Home_page.dart';
import 'package:flutter_catlog/utils/Routes.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRouts.homeRouts);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                'assets/Images/login.png',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Text("Welcome $name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      decoration: InputDecoration(
                        hintText: "Enter Email",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is Required";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is Required";
                        } else if (value.length < 6) {
                          return "Passward should greater then 6 char";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Material(
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 10),
                      color: Colors.deepPurple,
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          // decoration: BoxDecoration(

                          //     ),
                          height: 45,
                          width: changeButton ? 50 : 150,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                  size: 40,
                                )
                              : Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      letterSpacing: 1.0),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
