import 'package:cars_rental_office/screens/AddCar.dart';
import 'package:cars_rental_office/screens/LoginPage.dart';
import 'package:cars_rental_office/screens/ViewAndDeleteCar.dart';
import 'package:cars_rental_office/utils/utils.dart';
import 'package:cars_rental_office/widgets/BtnDetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatelessWidget {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static const String id = 'MainPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8e8e8),
      appBar: AppBar(
        backgroundColor: Color(0xffe8e8e8),
        elevation: 0,
        actions: [
          (userLoggedin != false)
              ? IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    _signOut();
                    Navigator.pushNamed(context, LoginPage.id);
                  })
              : Container()
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 40),
              child: Text('Main Menu',
                  style: TextStyle(fontSize: 30, fontFamily: 'bolt')),
            ),
            SizedBox(height: 30),
            BtnDetails(
              image: 'assets/images/bmw m3.png',
              title: 'Add new car',
              subtitle: 'Add new car to yuor collection',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddCar(),
                  ),
                );
              },
            ),
            BtnDetails(
              image: 'assets/images/bmw m5.png',
              title: 'View or delete car',
              subtitle: 'View or delete car from yuor collection',
              onPressed: () {
                Navigator.pushNamed(context, ViewAndDeleteCar.id);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/images/car.svg',
                width: 200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
