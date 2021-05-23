import 'package:cars_rental_office/models/CarInfo.dart';
import 'package:cars_rental_office/utils/utils.dart';
import 'package:cars_rental_office/widgets/CarDetailCard.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ViewAndDeleteCar extends StatefulWidget {
  static const String id = 'DeleteCar';
  @override
  _ViewAndDeleteCarState createState() => _ViewAndDeleteCarState();
}

class _ViewAndDeleteCarState extends State<ViewAndDeleteCar> {
  List<CarInfo> carsDetail = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8e8e8),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  youHaveData = false;
                  carsDetail.clear();
                  getData();
                });
              })
        ],
        backgroundColor: Color(0xffe8e8e8),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        title: Text(
          'Delete Car',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: (youHaveData != true)
          ? Container(
              child: Center(
                child: Text('Wait to get data'),
              ),
            )
          : ListView.builder(
              itemCount: carsDetail.length,
              itemBuilder: (context, index) {
                return CarDetailCard(
                  carsDetail: carsDetail,
                  index: index,
                );
              },
            ),
    );
  }

  Future<void> getData() async {
    DatabaseReference carRef =
        FirebaseDatabase.instance.reference().child('cars');

    CarInfo carDetail;
    var keys;
    String carModel;
    String pricePerDay;
    String features;
    String carColor;
    String gearBox;
    String fuel;
    String carType;
    String carSeat;
    String carNumber;
    String dateOfFactor;
    String url;

    carRef.once().then((DataSnapshot snapshot) {
      keys = snapshot.value.keys;

      for (var key in keys) {
        carModel = snapshot.value[key]['carModel'];
        carNumber = snapshot.value[key]['carNumber'];
        carColor = snapshot.value[key]['carColor'];
        pricePerDay = snapshot.value[key]['pricePerDay'];
        features = snapshot.value[key]['features'];
        gearBox = snapshot.value[key]['gearBox'];
        fuel = snapshot.value[key]['fuel'];
        carType = snapshot.value[key]['carType'];
        carSeat = snapshot.value[key]['carSeat'];
        dateOfFactor = snapshot.value[key]['dateOfFactor'];
        url = snapshot.value[key]['image_url'];

        carDetail = CarInfo(
          key: key,
          carColor: carColor,
          carModel: carModel,
          carNumber: carNumber,
          carSeats: carSeat,
          carType: carType,
          dateOfFactor: dateOfFactor,
          features: features,
          fuel: fuel,
          gearbox: gearBox,
          pricePerDay: pricePerDay,
          urlImage: url,
        );
        carsDetail.add(carDetail);
      }
      setState(() {
        youHaveData = true;
      });
    });
  }
}
