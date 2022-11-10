import 'dart:io';
import 'dart:ui';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';




class MyApp  extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Presco',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF3b3e51),
        backgroundColor: const Color(0xFF3b3e51),
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Presco'),
    );
  }
}

class OverlayPage extends StatefulWidget {
 OverlayPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OverlayPage createState() => _OverlayPage();
}

class _OverlayPage extends State<OverlayPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                Color(0xff242335),
                Color(0xff3b3e51),
              ],
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(20, 50, 20, 50),
                width: 10000,
                height: 650,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color:  Color(0xee242335),
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                        currentData.description,
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Gotham Black',
                          color: Colors.white,
                        ),
                    ),
                    Text(
                      currentData.amount.toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Gotham Black',
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      currentData.index.toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Gotham Black',
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${currentData.date.day}.${currentData.date.month}.${currentData.date.year}',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Gotham Black',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        tooltip: 'back',
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromRGBO(229, 141, 144, 1), Color.fromRGBO(248, 56, 94, 1)],
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Container(
            width: 10000,
            height: 10000,
            alignment: Alignment.center,
            child: const Icon(Icons.arrow_back),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
      ),
    );
  }
}
