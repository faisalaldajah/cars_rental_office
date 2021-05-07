import 'package:flutter/material.dart';
// ignore: must_be_immutable
class Walit extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _Walit();
  }
}

class _Walit extends State<Walit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('RENT CAR'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.grey.shade100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Nmbutton(
                down: false,
                icon: Icons.arrow_back,
              ),
              Nmbutton(
                down: false,
                icon: Icons.search,
              ),
            ],
          ),
          Text(
            'Main Card',
            style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 30,
                fontWeight: FontWeight.w700),
          ),
          Creditcard(
            cardName:'ammar',
            cardNumber: '*************0918',
            expires: '02/22'
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RaisedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return null;
                      }));
                },
                icon: Icon(Icons.add_rounded),
                label: Text(""),
              ),
              RaisedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.credit_card),
                label: Text(""),
              ),
            ],
          ),
        ],
      ),);
  }
}
class Creditcard extends StatelessWidget {
  final cardName;
  final cardNumber;
  final expires;
  const Creditcard({this.cardName, this.cardNumber, this.expires});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),color:Colors.grey[500] ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('VISA'),
              Icon(
                Icons.more_horiz,
                color: Colors.grey.shade700,
              ),
            ],
          ),
          SizedBox(
            height: 25.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                cardNumber,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Card Name',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    cardName,
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Expires',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    expires,
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Nmbutton extends StatelessWidget {
  final bool down;
  final IconData icon;
  const Nmbutton({this.down, this.icon});
  @override
  Widget build(BuildContext context) {
    // TODO: implement createState
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
      child: Icon(icon, color: Colors.grey.shade700),
    );
  }
}

class Nmcard extends StatelessWidget {
  final bool active;
  final IconData icon;
  final String lebel;
  const Nmcard({this.active, this.icon, this.lebel});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.grey,
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            lebel,
            style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w700,
                fontSize: 16),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.green.withOpacity(0.65)),
            width: 70,
            height: 40,
            child: Container(
              margin: active
                  ? EdgeInsets.fromLTRB(35, 5, 5, 5)
                  : EdgeInsets.fromLTRB(5, 5, 35, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey.shade100,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.075),
                      offset: Offset(2, 2),
                      blurRadius: 2,
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
