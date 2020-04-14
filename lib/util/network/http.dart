import 'package:dio/dio.dart';
import 'package:app_template/util/storage/storage.dart';

class HttpHelper {
  static Dio _client;
  static String urlBase = "http://192.168.0.2:3333"; //URL base das APIs

  static Future<Dio> _getInstance({ bool isAuth, Map<String, dynamic> headers }) async {
    if (_client == null) _client = Dio();

    if (isAuth == true) {
      _client.options.headers = {
        "Content-Type": "x-www-form-urlencoded"
      };

      return _client;
    }

    if (headers != null) {
      _client.options.headers = headers;
      return _client;
    }

    //final token = await StorageHelper.get('token');

    _client.options.headers = {
      'Content-Type': 'application/json',
      //'Authorization': 'Bearer $token'
    };

    return _client;
  }

  static Future<Response> get(String endpoint, { Map<String, dynamic> headers }) async {
    final instance = await _getInstance(headers: headers);
    return instance.get(urlBase + endpoint);
  }

  static Future<Response> post(String endpoint, { Map<String, dynamic> body, Map<String, dynamic> headers }) async {
    final instance = await _getInstance(headers: headers);
    return instance.post(urlBase + endpoint, data: body);
  }

  static Future<Response> put(String endpoint, { Map<String, dynamic> body, Map<String, dynamic> headers }) async {
    final instance = await _getInstance(headers: headers);
    return instance.put(urlBase + endpoint, data: body);
  }

  static Future<Response> delete(String url, { Map<String, dynamic> body, Map<String, dynamic> headers }) async {
    final instance = await _getInstance(headers: headers);
    return instance.delete(url);
  }
}