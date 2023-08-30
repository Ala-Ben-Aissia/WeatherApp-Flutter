import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  hintText: 'Enter city Name',
  hintStyle: TextStyle(color: Colors.grey),
);
