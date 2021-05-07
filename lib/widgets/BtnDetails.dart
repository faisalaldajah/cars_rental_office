import 'package:cars_rental_office/utils/utils.dart';
import 'package:flutter/material.dart';

class BtnDetails extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final Function onPressed;
  BtnDetails({
    @required this.image,
    @required this.subtitle,
    @required this.title,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [colorBtn, colorBtn1],
              ),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                    blurRadius: 2,
                    color: Colors.black38,
                    offset: Offset(0.7, 0.7),
                    spreadRadius: 0.7)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'bolt',
                      color: Colors.white,
                    ),
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.black26,
                      child: IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.arrow_forward_ios),
                          onPressed: onPressed),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                width: 120,
                height: 60,
                child: Text(
                  subtitle,
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 40,
          right: 10,
          bottom: 2,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: Image.asset(
                image,
                width: 160,
                fit: BoxFit.contain,
              ),
            ),
          ),
        )
      ],
    );
  }
}
