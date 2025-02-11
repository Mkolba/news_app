import 'package:flutter/material.dart';
import 'package:news_app/core/di/di_container.dart';
import 'app.dart';

void main() {
  setupLocator();
  runApp(const App());
}