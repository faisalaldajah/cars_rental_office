import 'package:cars_rental_office/widgets/SmallBtn.dart';
import 'package:flutter/material.dart';

class EndDialog extends StatelessWidget {
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
            Text('Done', style: TextStyle(fontSize: 18, fontFamily: 'bolt')),
            SizedBox(
              height: 30,
            ),
            Text(
              'All data get add to your Database',
              style: TextStyle(fontSize: 22, fontFamily: 'bolt'),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Icon(
              Icons.done,
              color: Colors.green,
              size: 50,
            ),
            Text('Good luck to rent your car'),
            SmallBtn(
              title: 'confirm',
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
