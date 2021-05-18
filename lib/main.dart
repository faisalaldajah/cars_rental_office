import 'package:cars_rental_office/screens/ResetPassword.dart';
import 'package:cars_rental_office/screens/ViewAndDeleteCar.dart';
import 'package:cars_rental_office/screens/LoginPage.dart';
import 'package:cars_rental_office/screens/RegistrationPage.dart';
import 'package:cars_rental_office/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/MainPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // ignore: await_only_futures
  currentFirebaseUser = await FirebaseAuth.instance.currentUser;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'okCar',
      initialRoute: (currentFirebaseUser == null) ? LoginPage.id : MainPage.id,
      routes: {
        MainPage.id: (context) => MainPage(),
        RegistrationPage.id: (context) => RegistrationPage(),
        LoginPage.id: (context) => LoginPage(),
        ViewAndDeleteCar.id: (context) => ViewAndDeleteCar(),
        ResetPassword.id: (context) => ResetPassword(),
      },
    );
  }
}
