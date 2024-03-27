// import 'package:device_information/device_information.dart';

import 'package:flutter/material.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

// class DeviceUUIDFetcher {
//   static Future<String?> getDeviceUUID(BuildContext context) async {
//     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//     if (Theme.of(context).platform == TargetPlatform.iOS) {
//       IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
//       return iosDeviceInfo.identifierForVendor; // 获取iOS设备的UUID
//     } else {
//       AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
//       return androidDeviceInfo.androidId; // 获取Android设备的UUID
//     }
//   }
// }

class DeviceInfo {
  // static Future<String> getPlatformVersion() async {
  //   try {
  //     return await DeviceInformation.platformVersion;
  //   } catch (e) {
  //     print('Failed to get platform version.');
  //     return '';
  //   }
  // }

  // static Future<String> getIMEINumber() async {
  //   try {
  //     return await DeviceInformation.deviceIMEINumber;
  //   } catch (e) {
  //     print('Failed to get IMEI number.');
  //     return '';
  //   }
  // }

  // static Future<String> getDeviceModel() async {
  //   try {
  //     return await DeviceInformation.deviceModel;
  //   } catch (e) {
  //     print('Failed to get device model.');
  //     return '';
  //   }
  // }
  static late String appInfo;
  static late String deviceModel;
  static late String systemVersion;
  static String? scale;

  static Future<String> getDeviceUUID() async {
    try {
      String deviceId = await PlatformDeviceId.getDeviceId ?? '';
      return deviceId; // 如果deviceId为null，则返回空字符串
    } catch (e) {
      print("Error getting device UUID: $e"); // 打印错误信息
      return ""; // 返回空字符串作为默认值
    }
  }

  static Future<void> initAppInfo() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
      String bundleExecutable = packageInfo.appName ?? packageInfo.packageName;
      String bundleShortVersionString = packageInfo.version ?? packageInfo.buildNumber;
      deviceModel  = androidInfo.model ?? 'Unknown';
      systemVersion = androidInfo.version.release ?? 'Unknow';
      appInfo = '$bundleExecutable/$bundleShortVersionString';
    } catch (e) {
      appInfo = 'Error: $e';
    }
  }

  static void updateScale(BuildContext context) {
    scale = MediaQuery.of(context).devicePixelRatio.toString();
  }

  static String getFullAppInfo() {
    String scaleInfo = scale != null ? 'Scale/$scale' : '';
    return '$appInfo ($deviceModel; Android $systemVersion;$scaleInfo)';
  }
/*
  static Future<void> initAppInfo(BuildContext context) async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
      String bundleExecutable = packageInfo.appName ?? packageInfo.packageName;
      String bundleShortVersionString =
          packageInfo.version ?? packageInfo.buildNumber;
      String model = androidInfo.model ?? 'Unknown';
      String systemVersion = androidInfo.version.release ?? 'Unknown';
      double scale = MediaQuery.of(context).devicePixelRatio;
      appInfo =
          '$bundleExecutable/$bundleShortVersionString ($model; Android $systemVersion; Scale/$scale)';
    } catch (e) {
      appInfo = 'Error: $e';
    }
  }
  */


  // Future<String> getAppInfo2(BuildContext context) async {
  //   try {
  //     PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //     AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
  //     String bundleExecutable = packageInfo.appName ?? packageInfo.packageName;
  //     String bundleShortVersionString =
  //         packageInfo.version ?? packageInfo.buildNumber;
  //     String model = androidInfo.model ?? 'Unknown';
  //     String systemVersion = androidInfo.version.release ?? 'Unknown';
  //     double scale = MediaQuery.of(context).devicePixelRatio;
  //     return '$bundleExecutable/$bundleShortVersionString ($model; Android $systemVersion; Scale/$scale)';
  //   } catch (e) {
  //     return 'Error: $e';
  //   }
  // }
}

/*

import 'package:flutter/material.dart';
import 'package:your_package_name/device_uuid_fetcher.dart';

class YourWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: DeviceUUIDFetcher.getDeviceUUID(context),
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // 显示加载指示器
        } else {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}'); // 显示错误消息
          } else {
            String? deviceUUID = snapshot.data;
            return Text('Device UUID: $deviceUUID'); // 显示设备UUID
          }
        }
      },
    );
  }
}
*/