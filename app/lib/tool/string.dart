import 'dart:math';

//16位随机数
String generateRandomString() {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
   final random = Random();
   final StringBuffer buffer = StringBuffer();
   for (var i = 0; i < 16; i++) {
     buffer.write(chars[random.nextInt(chars.length)]);
   }
   return buffer.toString();
}

//当前时间的毫秒数来生成一个基于时间的 16 位随机数
String generateRandomDateString() {
  final int milliseconds = DateTime.now().millisecondsSinceEpoch;
  final String randomString = (milliseconds % 9999999999999999).toString();
  return randomString.padLeft(16, '0');
}