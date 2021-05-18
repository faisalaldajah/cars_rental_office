import 'package:cars_rental_office/screens/LoginPage.dart';
import 'package:cars_rental_office/screens/MainPage.dart';
import 'package:cars_rental_office/widgets/GradientButton.dart';
import 'package:cars_rental_office/widgets/ProgressDialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegistrationPage extends StatefulWidget {
  static const String id = 'registrationPage';
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              SizedBox(height: 40),
              SvgPicture.asset(
                'assets/images/logo.svg',
                width: 150,
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Welcome,',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'bolt-semibold',
                      ),
                    ),
                    Text(
                      'Sign up to continue!',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'bolt',
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              TextFeilds(),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFeilds extends StatefulWidget {
  @override
  _TextFeildsState createState() => _TextFeildsState();
}

class _TextFeildsState extends State<TextFeilds> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  void showSnackBar(String title) {
    final snackbar = SnackBar(
      content: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
    );
    // ignore: deprecated_member_use
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  void registerUser() async {
    //show please wait dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => ProgressDialog(
        status: 'Registering you...',
      ),
    );
    final User user = (await _auth
            .createUserWithEmailAndPassword(
      email: emailTextEditingController.text,
      password: passwordTextEditingController.text,
    )
            .catchError(
      (ex) {
        //check error and display message
        Navigator.pop(context);
        PlatformException thisEx = ex;
        showSnackBar(thisEx.message);
      },
    ))
        .user;

    Navigator.pop(context);
    // check if user registration is successful
    if (user != null) {
      print('id: ${user.uid}');
      DatabaseReference newUserRef =
          FirebaseDatabase.instance.reference().child('admin/${user.uid}');

      //Prepare data to be saved on users table
      Map userMap = {
        'fullname': fullnameTextEditingController.text,
        'email': emailTextEditingController.text,
        'phone': phoneTextEditingController.text,
      };

      newUserRef.set(userMap);

      //Take the user to the mainPage
      Navigator.pushNamedAndRemoveUntil(context, MainPage.id, (route) => false);
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  TextEditingController phoneTextEditingController = TextEditingController();

  TextEditingController fullnameTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          TextFormField(
            controller: fullnameTextEditingController,
            decoration: InputDecoration(
              labelText: 'Full name',
              labelStyle: TextStyle(
                fontSize: 14,
              ),
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: emailTextEditingController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Your Email',
              labelStyle: TextStyle(
                fontSize: 14,
              ),
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: passwordTextEditingController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'password',
              labelStyle: TextStyle(
                fontSize: 14,
              ),
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: phoneTextEditingController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Phone',
              labelStyle: TextStyle(
                fontSize: 14,
              ),
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ),
          SizedBox(height: 50),
          GradientButton(
            title: 'Registration',
            onPressed: () async {
              var connectivityResult = await Connectivity().checkConnectivity();
              if (connectivityResult != ConnectivityResult.mobile &&
                  connectivityResult != ConnectivityResult.wifi) {
                showSnackBar('No internet connectivity');
                return;
              }

              if (fullnameTextEditingController.text.length < 3) {
                showSnackBar('Please provide a valid fullname');
                return;
              }

              if (phoneTextEditingController.text.length < 10) {
                showSnackBar('Please provide a valid phone number');
                return;
              }

              if (!emailTextEditingController.text.contains('@')) {
                showSnackBar('Please provide a valid email address');
                return;
              }

              if (passwordTextEditingController.text.length < 8) {
                showSnackBar('password must be at least 8 characters');
                return;
              }

              registerUser();
            },
          ),
          SizedBox(height: 25),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginPage.id);
              },
              child: Text(
                'Do you have an Account? Login here',
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
    );
  }
}
