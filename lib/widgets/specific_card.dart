import 'package:cars_rental_office/utils/utils.dart';
import 'package:flutter/material.dart';

class SpecificsCard extends StatelessWidget {
  final double price;
  final String name;
  final String name2;

  SpecificsCard({this.price, this.name, this.name2});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: price == null ? 80 : 100,
      width: 100,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: price == null
          ? Column(
              children: [
                Text(
                  name,
                  style: textInput,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  name2,
                  style: bodyText,
                ),
              ],
            )
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  name,
                  style: bodyText,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  price.toString(),
                  style: bodyText,
                ),
                Text(name2)
              ],
            ),
    );
  }
}
