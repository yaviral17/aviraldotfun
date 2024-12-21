import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PayMeLocalStorage {
  static saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static readData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key);
    return value;
  }

  static removeData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}


/// *** *** *** *** *** Example *** *** *** *** *** ///

// LocalStorage localStorage = LocalStorage();
//
// // Save data
// localStorage.saveData('username', 'JohnDoe');
//
// // Read data
// String? username = localStorage.readData<String>('username');
// print('Username: $username'); // Output: Username: JohnDoe
//
// // Remove data
// localStorage.removeData('username');
//
// // Clear all data
// localStorage.clearAll();

