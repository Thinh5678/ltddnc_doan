import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltddnc_doan/LoginPage.dart';
import 'package:ltddnc_doan/auth.dart';

import 'widget/CategoriesWidget.dart';
import 'widget/HomeAppBar.dart';
import 'widget/ItemWidget.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  String? errorMessage = '';

  Future<void> signOut() async{
    try{
      await Auth().signOut();
    } on FirebaseAuthException catch(e){
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build( BuildContext context ){
    return Scaffold(
      body: ListView(
        children: [
          HomeAppBar(),
          Container(
            // height tam thoi
            // height: 500,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [

                //Search Widget
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Tìm kiếm thứ bạn muốn...",
                          ),
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.search,
                        size: 27,
                        color: Colors.blueGrey,
                      ),
                    ],
                  ),
                ),

                //Categories
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Text(
                    'Danh mục',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),

                //Categories Widget
                CategoriesWidget(),

                //Item
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text("Best Selling",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                  ),
                ),

                //Item Widget
                ItemWidget(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index){},
        height: 60,
        color: Colors.blueGrey,
        items: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, "Homepage");
            },
            child: Icon(Icons.home, size: 30, color: Colors.white),
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, "cartPage");
            },
            child: Icon(CupertinoIcons.cart_fill, size: 30, color: Colors.white),
          ),
          InkWell(
            onTap: (){
              signOut().then((value) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              });
            },
            child: Icon(Icons.logout, size: 30, color: Colors.white),
          ),
        ],
      ),
    );
  }
}