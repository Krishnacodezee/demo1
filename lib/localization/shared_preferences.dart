import 'package:shared_preferences/shared_preferences.dart';

setSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();

// Save an integer value to 'counter' key.
  await prefs.setInt('counter', 10);
// Save an boolean value to 'repeat' key.
  await prefs.setBool('repeat', true);
// Save an double value to 'decimal' key.
  await prefs.setDouble('decimal', 1.5);
// Save an String value to 'action' key.
  await prefs.setString('action', 'Start');
// Save an list of strings to 'items' key.
  await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);
}

getSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  final int? counter = prefs.getInt('counter');
// Try reading data from the 'repeat' key. If it doesn't exist, returns null.
  final bool? repeat = prefs.getBool('repeat');
// Try reading data from the 'decimal' key. If it doesn't exist, returns null.
  final double? decimal = prefs.getDouble('decimal');
// Try reading data from the 'action' key. If it doesn't exist, returns null.
  final String? action = prefs.getString('action');
// Try reading data from the 'items' key. If it doesn't exist, returns null.
  final List<String>? items = prefs.getStringList('items');

  // Remove data for the 'counter' key.
  final success = await prefs.remove('counter');

  Map<String, Object> values = <String, Object>{'counter': 1};
  SharedPreferences.setMockInitialValues(values);
}
