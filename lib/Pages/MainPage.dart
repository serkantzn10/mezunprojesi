import 'dart:async';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Go Dutch App',  style: TextStyle(
          letterSpacing: 2.5),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.qr_code,
              size: 100,
              color: Colors.blue.shade400,
            ),
            SizedBox(height: 30),
            Text(
              'Scan QR Code to View Menu',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.indigo.shade400),
            ),
            SizedBox(height: 50),

            ElevatedButton(
              onPressed: () {
                Timer(const Duration(seconds: 2), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserInfoPage()),
                  );
                });

                scanner.scan().then((String? qrResult) {

                  if (qrResult != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserInfoPage()),
                    );
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo.shade400,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Scan QR Code',
                style: TextStyle(fontSize: 22),
              ),
            ),

          ],
        ),
      ),
    );
  }
}




class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _tableNumberController = TextEditingController();

  void _navigateToHomePage() {
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String tableNumber = _tableNumberController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomePage(
          firstName: firstName,
          lastName: lastName,
          tableNumber: tableNumber,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _tableNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Information',
          style: TextStyle(
            letterSpacing: 2.0,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 2.0),
            Icon(
              Icons.person_pin_circle_rounded,
              size: 100,
              color: Colors.blue.shade400,
            ),
            SizedBox(height: 20.0),
            Text(
              'Please enter your information',
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                  color: Colors.indigo.shade400,

              ),
            ),
            SizedBox(height: 30.0),
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15.0),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15.0),
            TextField(
              controller: _tableNumberController,
              decoration: InputDecoration(
                labelText: 'Table Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: _navigateToHomePage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo.shade400,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('OK',
                style: TextStyle(fontSize: 18)
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String tableNumber;

  WelcomePage({required this.firstName, required this.lastName, required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome',
          style: TextStyle(
            letterSpacing: 2.5,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.restaurant,
              size: 100,
              color: Colors.blue,
            ),
            SizedBox(height: 16.0),
            Text(
              'Welcome $firstName $lastName',
              style: TextStyle(fontSize: 50, letterSpacing: 4.0,),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text(
              'Your Table Number is $tableNumber',
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 100.0),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage(firstName: '', lastName: '', tableNumber: '',)),
                );
              },
              icon: Icon(Icons.restaurant_menu),
              label: Text('View Menu', style: TextStyle(fontSize: 22),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo.shade400,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment',style: TextStyle(
          letterSpacing: 2.5,
        ),),
        backgroundColor: Colors.indigo.shade400,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Icon(
              Icons.payment_outlined,
              size: 100,
              color: Colors.blue.shade400,
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Card Number',
                hintText: 'Enter your card number',
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Expiration Date',
                      hintText: 'MM/YY',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      hintText: 'CVV',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            Text(
              'Total Price',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.indigo.shade400,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\280.00 TL',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderPlacedPage()),
                  );
                },

              child: Text('Pay Now', style: TextStyle(fontSize: 18),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo.shade400,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}


class OrderPlacedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Placed'),
        backgroundColor: Colors.indigo.shade400,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 16),
            Text(
              'Thank you!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Your order has been placed!',
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

