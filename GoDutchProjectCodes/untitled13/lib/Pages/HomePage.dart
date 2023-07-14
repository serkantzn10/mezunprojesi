import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widgets/CategoriesWidget.dart';
import '../Widgets/DrawerWidget.dart';
import '../Widgets/PopularItemsWidget.dart';
import '../Widgets/NewestItemWidget.dart';


class HomePage extends StatelessWidget {

  final String firstName;
  final String lastName;
  final String tableNumber;

  const HomePage({super.key, required this.firstName, required this.lastName, required this.tableNumber});


  @override
  Widget build(BuildContext context) {



    return Scaffold(
    appBar: AppBar(
    title: Text('Menu',style: TextStyle(
      letterSpacing: 2.5,
    ),),
    ),
      body: ListView(
        children: [
          //const AppBarWidget(),

          Padding(
            padding: EdgeInsets.only(top: 25,left: 20),

          ),
          CategoriesWidget(),

          Padding(
            padding: EdgeInsets.only(top: 10,left: 20),
            child: Text(
              "Popular",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,
              ),
            ),
          ),
          PopularItemsWidget(),

          Padding(
            padding: EdgeInsets.only(top: 10,left: 20),
            child: Text(
              "Menu",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,
              ),
            ),
          ),

        NewestItemWidget(),
        ],
      ),
      drawer: DrawerWidget(),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0,3),
            )
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "cartPage");
          },
          child: Icon(
            CupertinoIcons.cart,
            size: 30,
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
