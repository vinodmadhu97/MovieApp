import 'package:flutter/material.dart';

import 'Ui/home.dart';
import 'Ui/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: MovieListView(),
    );
  }
}




