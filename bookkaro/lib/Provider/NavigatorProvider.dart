import 'package:flutter/cupertino.dart';

class NavProvider with ChangeNotifier {
  int _index = 0;
  int get index => _index;
  set index(int val) {
    _index = val;
  }

  void setValue(val) {
    _index = val;
    debugPrint('Called $_index');
    notifyListeners();
  }
}
