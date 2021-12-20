import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kDrawerTextStyle = TextStyle(fontSize: 16);
const kDrawerBoldTextStyle =
TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
const kMediumTextStyle = TextStyle(fontSize: 18, color: Colors.black);
final kTextInputTypeStyle = BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.black));
const userApi = "https://www.dropbox.com/s/sud7f1l9qhk52r8/users.json?dl=1";