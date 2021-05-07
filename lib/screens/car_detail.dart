import 'package:cars_rental_office/screens/LoginPage.dart';
import 'package:cars_rental_office/utils/utils.dart';
import 'package:flutter/material.dart';
import '../widgets/specific_card.dart';

class CarDetail extends StatelessWidget {
  final String title;
  final double price;
  final String color;
  final String gearbox;
  final String fuel;
  final String brand;
  final String path;
  final String carSeats;

  CarDetail({
    this.title,
    this.price,
    this.color,
    this.gearbox,
    this.fuel,
    this.brand,
    this.path,
    this.carSeats,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        height: 120,
        child: Column(
          children: [
            Text(title, style: paragraphText),
            Text(
              brand,
              style: textInput,
            ),
            Hero(tag: title, child: Image.asset(path)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SpecificsCard(
                  name: '60 Days',
                  price: price * 60,
                  name2: 'JD',
                ),
                SpecificsCard(
                  name: '30 Days',
                  price: price * 30,
                  name2: 'JD',
                ),
                SpecificsCard(
                  name: '1 Day',
                  price: price * 1,
                  name2: 'JD',
                )
              ],
            ),
            SizedBox(height: 10),
            Text(
              'SPECIFICATIONS',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SpecificsCard(
                  name: 'Color',
                  name2: color,
                ),
                SpecificsCard(
                  name: 'Car Seats',
                  name2: carSeats,
                ),
                SpecificsCard(
                  name: 'Gearbox',
                  name2: gearbox,
                ),
                SpecificsCard(
                  name: 'Fuel',
                  name2: fuel,
                )
              ],
            ),
            SizedBox(height: 10),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              disabledColor: Theme.of(context).accentColor,
              onPressed: () {
                return LoginPage();
              },
              child: Text(
                'Book Now',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
