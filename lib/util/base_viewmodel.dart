import 'package:flutter/cupertino.dart';
enum ViewState { Idle, Busy, Error }

class BaseViewModel extends ChangeNotifier {
  ViewState _viewState = ViewState.Idle;

  BaseViewModel(){}
  set viewState(ViewState state) {
    try {
      _viewState = state;
      notifyListeners();
    } catch (_) {}
  }

  bool get isIdle => _viewState == ViewState.Idle;
  bool get isBusy => _viewState == ViewState.Busy;
  bool get hasError => _viewState == ViewState.Error;
}
