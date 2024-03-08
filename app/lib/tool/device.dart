
import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

class DeviceUUIDFetcher {
  static Future<String?> getDeviceUUID(BuildContext context) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // 获取iOS设备的UUID
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // 获取Android设备的UUID
    }
  }
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