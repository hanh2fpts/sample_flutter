import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_flutter/app/app.dart';
import 'package:sample_flutter/app/todo_observer.dart';
import 'package:sample_flutter/di/service_locator.dart';

void main() async {
  await setUpServiceLocator();
  Bloc.observer = TodoObserver();
  runApp(const MyApp());
}
