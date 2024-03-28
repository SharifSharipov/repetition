import 'dart:convert';

import 'package:http/http.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/data/models/post_model.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/domain/logger/logger_service.dart';

class ApiServiceTwo {
  static const String baseUrl = "jsonplaceholder.typicode.com";
  static Map<String, String> headers = {"Content-Type": "application/json;charset=UTF-8"};

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(baseUrl, api, params);
    var response = await get(uri, headers: headers);
    LoggerService.e("API=>$baseUrl+$api");
    LoggerService.w("Params=>${params.toString()}");
    LoggerService.i("Response=>${response.body}");

    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(baseUrl, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    LoggerService.d(response.body);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(baseUrl, api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    LoggerService.d("API=>$api");
    LoggerService.d("Params=>${params.toString()}");
    LoggerService.d("Response=>${response.body}");

    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, String> params) async {
    var uri = Uri.https(baseUrl, api, params);
    var response = await delete(uri, headers: headers);
    LoggerService.d("API=>$api");
    LoggerService.d("Params=>${params.toString()}");
    LoggerService.d("Response=>${response.body}");

    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
  static String API_LIST = "/posts";
  static String API_CREATE = "/posts";
  static String API_UPDATE = "/posts/"; //{id}
  static String API_DELETE = "/posts/"; //{id}

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, String> paramsCreate(PostModel post) {
    Map<String, String> params = {};
    params.addAll({
      "title": post.title,
      "body": post.body,
      "userId": post.userId.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(PostModel post) {
    Map<String, String> params = {};
    params.addAll({
      "id": post.id.toString(),
      "title": post.title,
      "body": post.body,
      "userId": post.userId.toString(),
    });
    return params;
  }

  static List<PostModel> parsePostList(String responseBody) {
    dynamic jsonList = jsonDecode(responseBody);
    if (jsonList is List) {
      return jsonList.map((item) => PostModel.fromJson(item)).toList();
    } else {
      return [];
    }
  }

/*
  static List<PostModel> parsePostList(String responseBody) {
    dynamic json = jsonDecode(responseBody);
    var data= List<PostModel>.from(json(json.map((x) => PostModel.fromJson(x))));
    return data;
  }*/
}
