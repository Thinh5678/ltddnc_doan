import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomeAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
        Icon(
          Icons.sort,
          size: 30,
          color: Colors.blueGrey,
        ),
          Padding(padding: EdgeInsets.only(left: 20,
          ),
            child: Text(
              "Shop of Clothes",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
          ),
          Spacer(),
            badges.Badge(
              badgeStyle: badges.BadgeStyle(
                badgeColor: Colors.red,
                padding: EdgeInsets.all(7),
              ),
              badgeContent: Text(
                "3",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, "cartPage");
                },
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: 35,
                  color: Colors.blueGrey,
                ),
              ),
            ),
        ],
      ),
    );
  }
}