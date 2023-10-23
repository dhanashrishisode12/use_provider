import 'package:flutter/material.dart';

class HomePageProvider with ChangeNotifier {
  bool? isEligible;
  String? eligibilityMassage = " ";

  void checkEligibility(int age) {
    if (age >= 18) {
      isEligible = true;
      eligibilityMassage = "you are aligible";
      notifyListeners();
    } else {
      isEligible = false;
      eligibilityMassage = "you are not eligible!";
      notifyListeners();
    }
  }
}
