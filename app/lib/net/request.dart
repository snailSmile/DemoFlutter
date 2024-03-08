import 'dart:convert';
import 'dart:io';

import 'package:fxtp_app/tool/string.dart';

Future<String> fetchData(String url, Map<String, dynamic> data,
    {bool isPost = true}) async {
  var httpClient = HttpClient();
  try {
    httpClient.findProxy = (url) {
      return 'PROXY 21.163.79.158:8888';
    };
    late HttpClientRequest request;
    if (isPost) {
      request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('Content-Type', 'applocation/json; charset= UTF-8');
      request.headers.set('Accept', 'application/json');
      request.headers.set('x-ac-os-info', 'IOS');
      request.headers.set('x-ac-channel-id', 'FXTP');
      //@"Bearer 'token' forKey:@"Authorization"
      //x-ac-session-id
      request.headers.set('x-ac-app-version', '9.9.9');
      request.headers.set('x-ac-version', '9.9.9');
      //x-ac-device-id
      request.headers.set('x-ac-nonce', generateRandomString());
      DateTime date = DateTime.now();
      String millisecondsEpoch = date.millisecondsSinceEpoch.toString();
      request.headers.set('x-ac-time', millisecondsEpoch);
      request.headers.set('x-ac-trace-no', 'uuid');
      request.headers.set('Refer', 'https://ecloudsit.tppension.cntaiping.com');
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
