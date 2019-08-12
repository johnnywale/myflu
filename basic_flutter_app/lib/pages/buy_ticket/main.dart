import 'package:flutter/material.dart';
import 'package:we_rate_dogs/pages/buy_ticket/home_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'SF Pro Display'),
      title: 'Buy Tickets',
      home: BuyTicketHomePage(),
    );
  }
}
