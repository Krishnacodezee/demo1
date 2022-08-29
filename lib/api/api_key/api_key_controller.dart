import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:pattern_insert_delete/api/api_key/user_api_data.dart';
import 'package:retry/retry.dart';

Future<List<UserApiData>> weatherApiController() async {
  //20220617160908
  // final retryClient = RetryClient(client);
  final client = HttpClient();
  var url = Uri.parse('https://gorest.co.in/public/v2/todos');
  UserApiData? data;
  List<UserApiData> myModels = <UserApiData>[];
  try {
    final statusCode = await retry(
      () async {
// Make a HTTP request and return the status code.
        final request = await client
            .getUrl(Uri.parse('https://www.google.com'))
            .timeout(Duration(minutes: 48));
        final response = await request.close().timeout(Duration(minutes: 48));
        await response.drain();
        return response.statusCode;
      },
// Retry on SocketException or TimeoutException
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    var response = await http.get(url, headers: {
      'Authorization':
          'Bearer 42086b13f47a96ae874b930b764002dfa1a8b86da2c42fd4ba9602fc2c5b2133'
    });
    if (response.statusCode == 200) {
      print("object");
      print(response.body);
      print(response.headers.entries);
      myModels = (json.decode(response.body) as List<dynamic>)
          .map((i) => UserApiData.fromJson(i))
          .toList();
    } else if (response.statusCode == 401) {
      myModels = (json.decode(response.body) as List<dynamic>)
          .map((i) => UserApiData.fromJson(i))
          .toList();
      //refresh token and call getUser again
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    print(e.toString());
  } finally {
    client.close();
  }

  return myModels;
}

// final client = RetryClient(
//   http.Client(),
//   retries: 1,
//   when: (response) {
//     return response.statusCode == 401 ? true : false;
//   },
//   onRetry: (req, res, retryCount) {
//     if (retryCount == 0 && res?.statusCode == 401) {
//       // refresh token
//     }
//   },
// );
//
// try {
// final response = await client.get('http://www.example.com');
// } finally {
// client.close();
// }

// import 'dart:convert' as convert;
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:pattern_insert_delete/api/api_key/user_api_data.dart';
//
// Future<List<UserApiData>> weatherApiController() async {
//   var url = Uri.parse("https://gorest.co.in/public/v2/todos");
//   var l1;
//   //
//   List<UserApiData> posts = <UserApiData>[];
//   try {
//     var response = await http.get(url, headers: {
//       'Authorization':
//       'Bearer 42086b13f47a96ae874b930b764002dfa1a8b86da2c42fd4ba9602fc2c5b2133'
//     });
//     // List<dynamic> l = json.decode(response.body) as List<dynamic>;
//     l1 = [
//       for (final e in json.decode(response.body)) UserApiData.fromJson(e),
//     ];
//     // List<UserApiData> posts = (json.decode(response.body) as List)
//     //     .map((data) => UserApiData.fromJson(data))
//     //     .toList();
//     print(l1);
//     // List<UserApiData> posts =
//     // List<UserApiData>.from(l.map((model) => UserApiData.fromJson(model)))
//     //     .toList();
//
//     if (response.statusCode == 200) {
//       print('${response.statusCode}, ${response.body}');
//     } else {
//       print('Request failed with status: ${response.statusCode}');
//     }
//   } catch (e) {
//     print(e.toString());
//   }
//
//   return l1;
// }
