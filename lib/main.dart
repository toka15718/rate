// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, import_of_legacy_library_into_null_safe, avoid_print, deprecated_member_use

// @dart=2.9

import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: RaisedButton(
        onPressed: () {
          show();
        },
        child: Text('اضغط هنا للتقيم'),
      )),
    );
  }

  void show() {
    showDialog(
        context: context,
        barrierDismissible: true, // set to false if you want to force a rating
        builder: (context) {
          return RatingDialog(
            icon: const Icon(
              Icons.star,
              size: 100,
              color: Colors.amber,
            ), // set your own image/icon widget
            title: "تقيم السائق",
            description: "اضغط على نجمة لمنح تقييمك.",
            submitButton: "إرسال",
            alternativeButton: "اتصل بنا بدلا من ذلك؟", // optional
            positiveComment: "😍نحن سعداء جدا لسماعنا", // optional
            negativeComment: "😭نحن حزينون لسماع ذلك", // optional
            accentColor: Colors.amber, // optional
            onSubmitPressed: (int rating) {
              print("onSubmitPressed: rating = $rating");
              // ignore: todo
              // TODO: open the app's page on Google Play / Apple App Store
            },
            onAlternativePressed: () {
              print("onAlternativePressed: do something");
              // ignore: todo
              // TODO: maybe you want the user to contact you instead of rating a bad review
            },
          );
        });
  }
}
