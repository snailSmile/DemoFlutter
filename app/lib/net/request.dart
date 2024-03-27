import 'dart:convert';
import 'dart:io';

import 'package:FXTP/tool/string.dart';

Future<String> fetchData(String url, Map<String, dynamic> data,
    {bool isPost = true}) async {
  var httpClient = HttpClient();
  try {
    httpClient.findProxy = (url) {
      // return 'PROXY 21.163.79.79:8888';
      return 'PROXY 192.168.1.8:8888';
    };
    late HttpClientRequest request;
    if (isPost) {
      request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('Content-Type', 'application/json; charset= UTF-8');
      request.headers.set('Accept', 'application/json');
      request.headers.set('x-ac-os-info', 'IOS');
      request.headers.set('x-ac-channel-id', 'FXTP');
      //@"Bearer 'token' forKey:@"Authorization"
      request.headers.set('authorization',
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOltdLCJzdWIiOiIxNzEwNzQ5OTAwMzMxQ0NNeVZCWW5adEg2QU5RWVFXY2tNaiIsInVzZXJfbmFtZSI6IjQxMTcwMzU3ODUzMTgwNzIzMiIsImlzcyI6ImZ4dHAudGFpcGluZyIsInNjb3BlIjpbXSwiZ3JhbnRfdHlwZSI6InBhc3N3b3JkIiwianRpIjoiMTcxMDc0OTkwMDQyNER1UnBhaDZGUHpnRFRyOFNHcXVhMk8iLCJhZGRpdGlvbmFsSW5mbyI6e30sImlhdCI6MTcxMDc0OTkwMCwiZXhwIjoxNzEzMzQyMjAwLCJhdXRob3JpdGllcyI6W10sImNsaWVudF9pZCI6IkZYVFBfQVBQIn0.WfYXyRX6GCy4MfcbMo4P27m-_yytZ_XVgfQiAqfQh3rRIgYF_h_0i832gAHL3dwTZxF1k7vxfGEC2qGJ-SBfTRMy6Pf2Zg7Kmj1ueOAzNATFZdGJ5Nm4bTuWNx4wwrEEXAjCs9gUE7lvOCqQ1NKFnt4nmRQRImuetJdOL90IG-0KwEWt5TBBen7_sUO2jtJ4wUmqDX7Flp7vAzsTrowpIIzX_t_pHOdzEcLAOdu9JqvOuvz0ZmBtSsR41lv6q8pFusaQycYQmoWsO8mUTGqvvdtAE1cPO7SvM-RYBxd_sJ58BrkGMGaBPb4ExN_KMeTCaOlK2aawo3ExdsDTOpwqRQ');
      //x-ac-session-id
      request.headers.set('x-ac-app-version', '9.9.9');
      request.headers.set('x-ac-version', '9.9.9');
      //x-ac-device-id
      request.headers.set('x-ac-nonce', generateRandomString());
      DateTime date = DateTime.now();
      String millisecondsEpoch = date.millisecondsSinceEpoch.toString();
      request.headers.set('x-ac-time', millisecondsEpoch);
      request.headers.set('x-ac-trace-no', '37E865D9-596A-458B-B380-A25E850F2DD4');
      request.headers
          .set('Referer', 'https://ecloudsit.tppension.cntaiping.com');
      //userAgent = [NSString stringWithFormat:@"%@/%@ (%@; iOS %@; Scale/%0.2f)", [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleExecutableKey] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleIdentifierKey], [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleVersionKey], [[UIDevice currentDevice] model], [[UIDevice currentDevice] systemVersion], [[UIScreen mainScreen] scale]];
      request.headers
          .set('User-Agent', 'FXTP/9.9.9 (iPhone; iOS 17.2; Scale/3.00)');
      request.headers.set('x-ac-mc-type', 'gateway');
      request.write(jsonEncode(data));
    } else {
      String queryString =
          data.entries.map((e) => '${e.key}=${e.value}').join('&');
      request = await httpClient.getUrl(Uri.parse('$url?$queryString'));
    }
    var response = await request.close();
    var resposeBody = await response.transform(utf8.decoder).join();
    if (response.statusCode == 200) {
      return resposeBody;
    } else {
      print('Failed to fetch data, status code:${response.statusCode}');
      throw Exception(
          'Failed to fetch data, status code:${response.statusCode}');
    }
  } catch (e) {
    print('Failed to fetch data: $e');
    throw Exception('Failed to fetch data: $e');
  } finally {
    httpClient.close();
  }
}
