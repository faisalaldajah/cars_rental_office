import 'package:cars_rental_office/screens/MainPage.dart';
import 'package:cars_rental_office/screens/RegistrationPage.dart';
import 'package:cars_rental_office/utils/utils.dart';
import 'package:cars_rental_office/widgets/GradientButton.dart';
import 'package:cars_rental_office/widgets/ProgressDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:connectivity/connectivity.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'LoginPage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              SizedBox(height: 60),
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
                      'Sign in to continue!',
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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
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
          SizedBox(height: 50),
          GradientButton(
            title: 'Login',
            onPressed: () async {
              //check network availability

              var connectivityResult = await Connectivity().checkConnectivity();
              if (connectivityResult != ConnectivityResult.mobile &&
                  connectivityResult != ConnectivityResult.wifi) {
                showSnackBar('No internet connectivity');
                return;
              }

              if (!emailTextEditingController.text.contains('@')) {
                showSnackBar('Please enter a valid email address');
                return;
              }

              if (passwordTextEditingController.text.length < 8) {
                showSnackBar('Please enter a valid password');
                return;
              }

              login(context);
            },
          ),
          SizedBox(height: 25),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RegistrationPage.id);
              },
              child: Text(
                'Do not have an Account? Registration here',
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
    );
  }

  void chekUserData(BuildContext context) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.mobile &&
        connectivityResult != ConnectivityResult.wifi) {
      displayToastMessage('no internet access', context);
    } else if (!emailTextEditingController.text.contains('@')) {
      displayToastMessage('Email adress not valid', context);
    } else if (passwordTextEditingController.text.length < 6) {
      displayToastMessage('passwor is atleast 6 digit', context);
    } else
      login(context);
  }

  void login(BuildContext context) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) =>
            ProgressDialog(status: 'Logging you in'));

    final User user = (await _auth
            .signInWithEmailAndPassword(
      email: emailTextEditingController.text,
      password: passwordTextEditingController.text,
    )
            .catchError((errMsg) {
      Navigator.pop(context);
      displayToastMessage('Error: $errMsg', context);
    }))
        .user;

    if (user != null) {
      DatabaseReference userRef =
          FirebaseDatabase.instance.reference().child('users/${user.uid}');
      userRef.once().then((DataSnapshot snapshot) {
        if (snapshot.value != null) {
          Navigator.pushNamedAndRemoveUntil(
              context, MainPage.id, (route) => false);
        }
      });
    }
  }

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
}
