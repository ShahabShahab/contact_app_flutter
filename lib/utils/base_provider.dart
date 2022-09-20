import 'package:flutter/foundation.dart';

class BaseProvider with ChangeNotifier {
  ViewState _state = ViewState.IDLE;
  String error;

  ViewState get state => _state;

  bool get isLoading => _state == ViewState.LOADING;

  bool get hasError => _state == ViewState.ERROR;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void setErrorState(String error) {
    this.error = error;
    _state = ViewState.ERROR;
    notifyListeners();
  }

  void dispose();
}

enum ViewState { IDLE, LOADING, ERROR, INITIALIZE }
