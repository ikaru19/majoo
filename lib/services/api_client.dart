import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import 'env.dart';

class ApiClient {
  get({
    @required String url,
    Map<String, String> param,
    Map<String, String> headers,
    @required ValueChanged callback(int code, String message, dynamic json),
  }) async {
    var uri = Uri.https(Env.uri, url, param);
    http.get(uri, headers: headers).then((response) {
      print("GET ${response.statusCode}\n"
          "uri $uri\n"
          "${response.statusCode == 200 ? "" : "${response.body}"}");
      final dynamic res = jsonDecode(response.body);
      callback(response.statusCode,
          response.statusCode == 200 ? 'Request Sukses' : res["message"], res);
    }).catchError((e) {
      print(e);
      callback(400, "Terjadi kesalahan", null);
    });
  }


  post(
      {@required
          String url,
      Map<String, String> headers,
      Map<String, dynamic> body,
      @required
          ValueChanged callback(int code, String message, dynamic json)}) {
    Map<String, String> appHeaders = {"Content-Type": "application/json"};
    if (headers != null) {
      appHeaders.addAll(headers);
    }

    var uri = Uri.https(Env.uri, url);
    http
        .post(uri, headers: appHeaders, body: jsonEncode(body))
        .then((response) {
      print("POST ${response.statusCode}\n"
          "url $url\n"
          "header $headers\n"
          "body: $body"
          "${response.statusCode == 200 ? "" : "${response.body}"}");

      final dynamic res = jsonDecode(response.body);
      callback(
          response.statusCode,
          response.statusCode == 200
              ? 'Request Sukses'
              : res["message"].toString(),
          res);
    }).catchError((e) {
      print(e);
      callback(400, "Terjadi kesalahan", null);
    });
  }



  put(
      {@required
      String url,
        Map<String, String> headers,
        Map<String, dynamic> body,
        @required
        ValueChanged callback(int code, String message, dynamic json)}) {
    Map<String, String> appHeaders = {"Content-Type": "application/json"};
    if (headers != null) {
      appHeaders.addAll(headers);
    }

    var uri = Uri.https(Env.uri, url);
    http
        .put(uri, headers: appHeaders, body: jsonEncode(body))
        .then((response) {
      print("PUT ${response.statusCode}\n"
          "url $url\n"
          "header $headers\n"
          "body: $body"
          "${response.statusCode == 200 ? "" : "${response.body}"}");

      final dynamic res = jsonDecode(response.body);
      callback(
          response.statusCode,
          response.statusCode == 200
              ? 'Request Sukses'
              : res["message"].toString(),
          res);
    }).catchError((e) {
      print(e);
      callback(400, "Terjadi kesalahan", null);
    });
  }

  postMultipart(
      {@required
          String url,
      Map<String, String> headers,
      Map<String, dynamic> body,
      Map<String, dynamic> files,
      @required
          ValueChanged callback(
              int code, String message, Map<String, dynamic> json)}) async {
    var uri = Uri.https(Env.uri, url);
    print(uri);
    var request = new http.MultipartRequest("POST", uri);
    if (headers != null) request.headers.addAll(headers);
    if (body.isNotEmpty) request.fields.addAll(body);
    if (files.length > 0) {
      files.forEach((key, value) async {
        var stream = new http.ByteStream(Stream.castFrom(value.openRead()));
        // var stream = new http.ByteStream(DelegatingStream.typed(value.openRead()));
        // print(await stream.isEmpty);
        var length = await value.length();
        var multipartFile = new http.MultipartFile(
          key,
          stream,
          length,
          filename: basename(value.path),
        );

        // var multipartFile = await http.MultipartFile.fromPath("file", value.path);
        request.files.add(multipartFile);
      });
    }

    try {
      print("REQUEST ==> $request");
      var response = await request.send();
      var res = jsonDecode(await response.stream.bytesToString());

      print("POST ${response.statusCode}\n"
          "url $url\n"
          "${response.statusCode == 200 ? "" : "$res"}");
      callback(response.statusCode,
          response.statusCode == 200 ? 'Request Sukses' : res["message"], res);
    } catch (e) {
      print(e);
      callback(400, "Terjadi kesalahan", null);
    }
  }
}
