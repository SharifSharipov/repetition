import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:repetition/src/core/constants/app_constants.dart';
import 'package:repetition/src/features/architekture_patterns_setstate/data/models/my_github_model/my_github_model.dart';

import '../../data/models/universal_data/universal_data.dart';
import '../../data/repositories/storage_repository/storage_repository.dart';
class ApiService {
  final _dio = Dio(
    BaseOptions(
      //baseUrl: baseUrl,
      headers: {
        "Content-Type": "application/json",
      },
      connectTimeout: Duration(seconds: TimeOutConstants.connectTimeout),
      receiveTimeout: Duration(seconds: TimeOutConstants.receiveTimeout),
      sendTimeout: Duration(seconds: TimeOutConstants.sendTimeout),
    ),
  );

  ApiService() {
    _init();
  }

  _init() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          debugPrint("ERRORGA TUSHDI:${error.message} and ${error.response}");
          return handler.next(error);
        },
        onRequest: (requestOptions, handler) async {
          debugPrint("SO'ROV YUBORILDI :${requestOptions.path}");
          requestOptions.headers
              .addAll({"token": StorageRepository.getString("token")});
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          debugPrint("JAVOB KELDI :${response.requestOptions.path}");
          return handler.next(response);
        },
      ),
    );
  }
  Future<UniversalData>getMyGithubData()async{
    Response response;
    try{
      response =await _dio.get("https://api.github.com/users/SharifSharipov");
      if((response.statusCode! >= 200) && (response.statusCode! < 300)){
        return UniversalData(data: MyGithub.fromJson(response.data));
      }
      return UniversalData(error: "Other error");
    }on DioException catch(e){
      return UniversalData(error: e.response!.data["message"]);
    }catch(e){
      return UniversalData(error: e.toString());
    }
  }
}
UniversalData getDioCustomError(DioException exception) {
  debugPrint("DIO ERROR TYPE: ${exception.type}");
  if (exception.response != null) {
    return UniversalData(error: exception.response!.data["message"]);
  }
  switch (exception.type) {
    case DioExceptionType.sendTimeout:
      {
        return UniversalData(error: "sendTimeout");
      }
    case DioExceptionType.receiveTimeout:
      {
        return UniversalData(error: "receiveTimeout");
      }
    case DioExceptionType.cancel:
      {
        return UniversalData(error: "cancel");
      }
    case DioExceptionType.badCertificate:
      {
        return UniversalData(error: "badCertificate");
      }
    case DioExceptionType.badResponse:
      {
        return UniversalData(error: "badResponse");
      }
    case DioExceptionType.connectionError:
      {
        return UniversalData(error: "connectionError");
      }
    case DioExceptionType.connectionTimeout:
      {
        return UniversalData(error: "connectionTimeout");
      }
    default:
      {
        return UniversalData(error: "unknown");
      }
  }
}