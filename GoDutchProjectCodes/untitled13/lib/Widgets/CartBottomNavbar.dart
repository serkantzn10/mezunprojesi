import 'package:flutter/material.dart';

import '../Pages/MainPage.dart';

class CartBottomNavbar extends StatelessWidget {
  const CartBottomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Text("Total:",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 15,
              ),
              Text("\280 TL",
              style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              ),
            ],),
            ElevatedButton(
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentPage()),
                    );

                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                ),
              child: Text("Order Now",
                style: TextStyle(fontSize: 21),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
