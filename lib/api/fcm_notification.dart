import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
// pub glibal active flutterfire cli
class FcmNotifications {
  // Replace with server token from firebase console settings.
  static final String serverToken = 'lA7cq0U'; //url

  static Future sendAndNotificationMessage({
    required String pushToken,
    String title = '',
    required String message,
  }) async {
    await http.post(
      Uri.parse("htt/fcm/send"), //url
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'title': title != '' ? title : "WAMO",
            'body': message,
            "sound": "default"
          },
          'priority': 'high',
          'to': pushToken,
        },
      ),
    );
  }
}
