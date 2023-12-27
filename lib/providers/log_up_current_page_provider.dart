import 'package:flutter/material.dart';
import 'package:gesco/registration/school_manager/log_up/components/create_profile.dart';
import '../registration/school_manager/log_up/components/address_info.dart';
import '../registration/school_manager/log_up/components/otp_code.dart';
import '../registration/school_manager/log_up/components/personal_info.dart';
import '../registration/school_manager/log_up/components/select_gender.dart';

class LogUpCurrentPageProvider with ChangeNotifier {


  List<Widget> _logUpPages = [
    CreateProfile(),
    OtpCode(),
    AddressInfo(),
    PersonalInfo(),
    SelectGender(),
  ];
  int _lengthLogUpPages = 5; // La taille de la liste logUpPages
  Widget currentPage = CreateProfile();

  int _currentPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;
  int get lengthLogUpPages => _lengthLogUpPages;

  void initCurrentPageIndex() {
    _currentPageIndex = 0;
    notifyListeners();
  }

  void nextLogUpPage() {
    if(_currentPageIndex < _lengthLogUpPages - 1) {
      _currentPageIndex++;
      currentPage = _logUpPages[_currentPageIndex];
    }
    notifyListeners();
  }

  void previousLogUpPage() {
    if(_currentPageIndex > 0) {
      _currentPageIndex--;
      currentPage = _logUpPages[_currentPageIndex];
    }
    notifyListeners();
  }


}