import 'dart:io';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  bool isLoading = false;
  bool isError = false;
  String errorMessage = '';
}
