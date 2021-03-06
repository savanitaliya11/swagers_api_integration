import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

enum APIType { aGet, aPost, aDelete, aPut }

class APIHandler {
  static http.Response? response;

  static Future apiHandler(
      {required String? url,
      required APIType? apiType,
      Map<String, dynamic>? body,
      Map<String, String>? headers}) async {
    try {
      if (apiType == APIType.aGet) {
        response = await http.get(Uri.parse(url!), headers: headers);
      } else if (apiType == APIType.aPost) {
        response = await http.post(Uri.parse(url!),
            body: jsonEncode(body), headers: headers);
      } else if (apiType == APIType.aDelete) {
        response = await http.delete(Uri.parse(url!),
            body: jsonEncode(body), headers: headers);
      } else if (apiType == APIType.aPut) {
        response = (await http.put(Uri.parse(url!),
            body: jsonEncode(body), headers: headers));
      }

      if (response!.statusCode == 200) {
        return response!.body;
      } else if (response!.statusCode == 201) {
        return response!.body;
      } else if (response!.statusCode == 204) {
        return response!.body;
      } else {
        return null;
      }
    } catch (e) {
      log('ERROR:$e');
    }
  }
}
