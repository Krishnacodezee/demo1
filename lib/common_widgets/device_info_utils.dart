// import 'dart:io';
//
// import 'package:device_info_plus/device_info_plus.dart';
//
// class DeviceInfoUtils {
//   static final DeviceInfoUtils _singleton = DeviceInfoUtils._internal();
//
//   static String deviceId = '';
//
//   factory DeviceInfoUtils() {
//     return _singleton;
//   }
//
//   Future<void> init() async {
//     try {
//       final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//
//       if (Platform.isAndroid) {
//         deviceId = (await deviceInfo.androidInfo).androidId ?? '';
//       } else {
//         deviceId = (await deviceInfo.iosInfo).identifierForVendor ?? '';
//       }
//
//       print("device -> $deviceId");
//     } catch (e) {
//       print("error -> $e");
//     }
//   }
//
//   DeviceInfoUtils._internal();
// }
