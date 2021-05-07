import 'package:cars_rental_office/utils/utils.dart';
import 'package:cars_rental_office/widgets/SmallBtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProgressDialogs extends StatelessWidget {
  final Function getImageFromCamera;
  final Function getImageImageFromGallery;
  ProgressDialogs({this.getImageFromCamera, this.getImageImageFromGallery});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(top: 150, bottom: 250),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text('Choose image'),
            SizedBox(height: 40),
            Text(
              'Choose one of the following to upload the image',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Expanded(
                child: Container(
              child: SvgPicture.asset(
                'assets/images/city car.svg',
                width: 90,
              ),
            )),
            Row(
              children: [
                SmallBtn(
                  title: 'Upload',
                  color: Colors.grey,
                  onPressed: () {
                    getImageImageFromGallery();
                    Navigator.pop(context);
                  },
                ),
                SmallBtn(
                  title: 'Camera',
                  onPressed: () {
                    getImageFromCamera();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
