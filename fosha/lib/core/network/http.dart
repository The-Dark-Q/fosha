import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpHelper {
  static Future get({
    required String url,
  }) async {
    return await http
        .get(Uri.parse(url), headers: {"Content-Type": "application/json"});
  }

  static Future post({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    return await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: jsonEncode(body));
  }

  static Future put({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    return await http.put(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: jsonEncode(body));
  }

  static Future delete({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    return await http.delete(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: jsonEncode(body));
  }
}
