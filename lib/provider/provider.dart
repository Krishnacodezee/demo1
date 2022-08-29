//
// import 'package:provider/provider.dart';
// class ProviderDemo extends ChangeNotifierProvider{
//   String result = Provider.of<String>(context);
// }
import 'package:flutter/material.dart';

class CounterViewModel extends ChangeNotifier {

  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}