import 'package:cars_rental_office/utils/utils.dart';
import 'package:cars_rental_office/widgets/Dialogs.dart';
import 'package:cars_rental_office/widgets/EndDialog.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

// ignore: must_be_immutable
class AddCar extends StatefulWidget {
  final void Function(File pickedImage) imagePickFn;
  AddCar({this.imagePickFn});

  @override
  _AddCarState createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  TextEditingController carModelTextEditingController = TextEditingController();
  TextEditingController carTypeTextEditingController = TextEditingController();
  TextEditingController carColorTextEditingController = TextEditingController();
  TextEditingController carNumberTextEditingController =
      TextEditingController();
  TextEditingController dateOfFactorTextEditingController =
      TextEditingController();
  TextEditingController pricePerDayTextEditingController =
      TextEditingController();
  TextEditingController featuresTextEditingController = TextEditingController();
  TextEditingController fuelTextEditingController = TextEditingController();
  TextEditingController gearboxTextEditingController = TextEditingController();
  TextEditingController carSeatsTextEditingController = TextEditingController();
  TextEditingController carIDTextEditingController = TextEditingController();
  var url;
  DateTime currentDate = DateTime.now();
  var storage = FirebaseStorage.instance;

  File _image;
  List<File> _imageList = [];
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: Icon(
                Icons.done,
                size: 30,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) => EndDialog(),
                );
                addCarToDatabase();
              },
            ),
          )
        ],
        title: Text('Add new car'),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/images/city car.svg',
                width: 200,
              ),
            ),
            SizedBox(height: 10),
            Center(
                child: Text(
              'Set car details',
              style: paragraphText,
            )),
            SizedBox(height: 10),
            TextFormField(
              controller: carIDTextEditingController,
              decoration: InputDecoration(
                labelText: 'car ID',
                labelStyle: TextStyle(
                  fontSize: 14,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: carModelTextEditingController,
              decoration: InputDecoration(
                labelText: 'car model',
                labelStyle: TextStyle(
                  fontSize: 14,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: carTypeTextEditingController,
              decoration: InputDecoration(
                labelText: 'car Type',
                labelStyle: TextStyle(
                  fontSize: 14,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: carColorTextEditingController,
              decoration: InputDecoration(
                labelText: 'car color',
                labelStyle: TextStyle(
                  fontSize: 14,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: carNumberTextEditingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'car number',
                labelStyle: TextStyle(
                  fontSize: 14,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: dateOfFactorTextEditingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'date of factor',
                labelStyle: TextStyle(
                  fontSize: 14,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: featuresTextEditingController,
              decoration: InputDecoration(
                labelText: 'Features',
                labelStyle: TextStyle(
                  fontSize: 14,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: fuelTextEditingController,
              decoration: InputDecoration(
                labelText: 'Fuel',
                labelStyle: TextStyle(
                  fontSize: 14,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: gearboxTextEditingController,
              decoration: InputDecoration(
                labelText: 'Gearbox',
                labelStyle: TextStyle(
                  fontSize: 14,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: carSeatsTextEditingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Car seats',
                labelStyle: TextStyle(
                  fontSize: 14,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: pricePerDayTextEditingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Price per day',
                labelStyle: TextStyle(
                  fontSize: 14,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Container(
                child: Column(
                  children: [
                    Text('Choose image for new Car'),
                    IconButton(
                      icon: Icon(
                        Icons.image,
                        color: colorBtn1,
                        size: 50,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) => ProgressDialogs(
                              getImageFromCamera: getImageFromCamera,
                              getImageImageFromGallery:
                                  getImageImageFromGallery),
                        );
                      },
                    ),
                    SizedBox(height: 30),
                    Container(
                      child: (_image != null)
                          ? Image.file(_image)
                          : Text(
                              'no Image for car!!',
                              style: TextStyle(color: Colors.black),
                            ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  
  

  Future<void> addCarToDatabase() async {
    DatabaseReference addCarRef =
        FirebaseDatabase.instance.reference().child('cars').push();
    url = await storage
        .ref()
        .child('cars/${Uri.file(_image.path).pathSegments.last}.jpg')
        .getDownloadURL()
        .catchError((e) {
      print(e);
    });
    Map carDetails = {
      'id': carIDTextEditingController.text,
      'carModel': carModelTextEditingController.text,
      'carColor': carColorTextEditingController.text,
      'carType': carTypeTextEditingController.text,
      'carNumber': carNumberTextEditingController.text,
      'dateOfFactor': dateOfFactorTextEditingController.text,
      'pricePerDay': pricePerDayTextEditingController.text,
      'features': featuresTextEditingController.text,
      'fuel': fuelTextEditingController.text,
      'gearBox': gearboxTextEditingController.text,
      'carSeat': carSeatsTextEditingController.text,
      'image_url': url
    };
    addCarRef.set(carDetails);

    setState(() {
      carIDTextEditingController.clear();
      carColorTextEditingController.clear();
      carModelTextEditingController.clear();
      carNumberTextEditingController.clear();
      carTypeTextEditingController.clear();
      dateOfFactorTextEditingController.clear();
      pricePerDayTextEditingController.clear();
      gearboxTextEditingController.clear();
      fuelTextEditingController.clear();
      carSeatsTextEditingController.clear();
      featuresTextEditingController.clear();
      _image = null;
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  Future getImageFromCamera() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _imageList.add(_image);
      } else {
        print('No image selected.');
      }
    });
    if (_image != null) {
      storage
          .ref()
          .child('cars/${Uri.file(_image.path).pathSegments.last}.jpg')
          .putFile(_image)
          .catchError((e) {
        print(e);
      });
    }
  }

  Future getImageImageFromGallery() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _imageList.add(_image);
      } else {
        print('No image selected.');
      }
    });
    if (_image != null) {
      storage
          .ref()
          .child('cars/${Uri.file(_image.path).pathSegments.last}.jpg')
          .putFile(_image)
          .catchError((e) {
        print(e);
      });
    }
  }
}
