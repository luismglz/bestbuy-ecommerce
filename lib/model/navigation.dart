import 'package:flutter/cupertino.dart';

class Navigation with ChangeNotifier{
  int _currentPage = 0;

  int get currentPage => this._currentPage;

  set currentPage(int value){
    this._currentPage = value;
    notifyListeners();
  }
}