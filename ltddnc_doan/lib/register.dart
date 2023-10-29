import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ltddnc_doan/Homepage.dart';
import 'package:ltddnc_doan/auth.dart''';

class RegisterPage extends StatefulWidget{
  const RegisterPage ({Key? key}): super (key: key);

  @override
  State<RegisterPage> createState() => _registerPageState();
}

class _registerPageState extends State<RegisterPage>{
  String? errorMessage = '';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerUsername = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async{
    try{
      await Auth().createUserWithEmailAndPassword(
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
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
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
                        controller: _controllerUsername,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Nhập user name"
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
              InkWell(
                onTap: (){
                  createUserWithEmailAndPassword().then((value) =>
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage())));
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
                  "Đăng ký",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1
                  ),
                ),
                ),
              ),
              _errorMessage(),
            ],
          ),
        ),
      ),
    );
  }
}