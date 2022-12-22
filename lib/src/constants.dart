import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff02c39a);

const kSecondryColor = Color(0xff52b788);

const double kPadding = 16.0;

const String kEndPoint = "http://192.168.10.111:9000/api/v1/";

dynamic kAlert = (context, title) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));

const String kuser="user";
const String kCart="cart";
