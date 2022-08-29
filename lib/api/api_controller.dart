import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;
import 'package:pattern_insert_delete/api/country_api_data.dart';

class countryDataProvider with ChangeNotifier {
  CountryApiData CountryData = CountryApiData();
  bool loading = true;

  getCountryData(context) async {
    CountryData = await apiController(context);
    print(CountryData);
    loading = false;

    notifyListeners();
  }
}

Future<CountryApiData> apiController(context) async {
  // SharedPreferences shared_User = await SharedPreferences.getInstance();
  // Map decode_options = jsonDecode(jsonString);
  // String user = jsonEncode(User.fromJson(decode_options));
  // shared_User.setString('user', user);
  //
  // SharedPreferences shared_User = await SharedPreferences.getInstance();
  // Map userMap = jsonDecode(shared_User.getString('user'));
  // var user = User.fromJson(userMap);
  //--------
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  // Map<String, dynamic> user =
  // {'Usrname':'tom','Password':'pass@123'};
  //
  // bool result = await prefs.setString('user', jsonEncode(user));
  //
  // String userPref = prefs.getString('user');
  //
  // Map<String,dynamic> userMap = jsonDecode(userPref) as Map<String, dynamic>;
  //------ save response
  // SharedPreferences pref = await SharedPreferences.getInstance();
  // Map json = jsonDecode(jsonString);
  // String user = jsonEncode(UserModel.fromJson(json));
  // pref.setString('userData', user);
  //--fetch response
  // SharedPreferences pref = await SharedPreferences.getInstance();
  // Map json = jsonDecode(pref.getString('userData'));
  // var user = UserModel.fromJson(json);
  //
  //20220617160908
  // var url = 'https://api.nationalize.io/?name=nathaniel';
  var url = Uri.parse('https://api.nationalize.io/?name=nathaniel');

  // var modal = Uri.parse(FlutterConfig.get(url));
  CountryApiData? data;
  try {
    var response = await http.get(url);
    data = CountryApiData.fromJson(response.body);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print('----------------header --entries ----${response.headers.entries}');
      print(jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    print(e.toString());
  }

  return data!;
}
