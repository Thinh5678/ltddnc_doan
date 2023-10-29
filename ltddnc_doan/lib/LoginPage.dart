import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ltddnc_doan/Homepage.dart';
import 'package:ltddnc_doan/auth.dart''';
import 'package:ltddnc_doan/register.dart';

class LoginPage extends StatefulWidget{
  const LoginPage ({Key? key}): super (key: key);

  @override
  State<LoginPage> createState() => _loginPageState();
}

class _loginPageState extends State<LoginPage>{
  String? errorMessage = '';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async{
    try{
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch(e){
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _errorMessage(){
    return Text(errorMessage == ''? '' :'Hum ? $errorMessage');
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 15),
                child: Image.asset("images_flutter/login.png"),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(1),
                        blurRadius: 5,
                        spreadRadius: 1
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 27,
                      color: Colors.black38,
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      width: 250,
                      child: TextFormField(
                        controller: _controllerEmail,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Nhập email đăng nhập"
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(1),
                        blurRadius: 5,
                        spreadRadius: 1
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.lock,
                      size: 27,
                      color: Colors.black38,
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 250,
                      child: TextFormField(
                        controller: _controllerPassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Nhập password"
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: (){},
                  child: Text(
                    "Quên mật khẩu ?",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  signInWithEmailAndPassword().then((value) =>
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()))
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.3),
                            blurRadius: 5,
                            spreadRadius: 1
                        ),
                      ]
                  ),child: Text(
                  "Đăng nhập",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1
                  ),
                ),
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bạn chưa có tài khoản ? -",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  TextButton(
                      onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RegisterPage()));
                  },
                      child: Text("Đăng kí", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),)),
                ],
              ),
              _errorMessage(),
            ],
          ),
        ),
      ),
    );
  }
}