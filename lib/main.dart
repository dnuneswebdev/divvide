import 'package:divvide/screens/bill_detail.dart';
import 'package:divvide/screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DiVVide',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        hintColor: Colors.deepOrange,
      ),
      // theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => Home(),
        'bill-detail': (BuildContext context) => BillDetail(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
