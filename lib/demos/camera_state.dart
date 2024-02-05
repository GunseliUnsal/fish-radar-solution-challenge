import 'package:flutter/foundation.dart';

class CameraState extends ChangeNotifier {
  bool _clicked = false;

  bool get clicked => _clicked;

  set SetValue(bool newValue) {
    if (_clicked != newValue) {
      _clicked = newValue;
      notifyListeners();
    }
  }
}
