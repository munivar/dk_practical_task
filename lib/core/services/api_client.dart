import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sgmasms/core/error/failure.dart';
import 'package:sgmasms/core/services/api_const.dart';

class ApiClient {
  var dio = Dio();
  var receiveTimeOut = const Duration(milliseconds: 25000);

  ApiClient() {
    dio.interceptors.add(PrettyDioLogger(
      compact: true,
      request: true,
      requestBody: true,
    ));
  }

  // GET METHOD
  Future<Response> get(
    String api,
    String? authToken,
    CancelToken? cancelToken, {
    Map<String, String>? customHeaders,
    ProgressCallback? onReceiveProgress,
    Options? options,
  }) async {
    var url = ApiConst.baseURL + api;
    var headers = hheaders(authToken ?? "", customHeaders);
    var result = await dio.get(
      url,
      options:
          options ?? Options(headers: headers, receiveTimeout: receiveTimeOut),
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
    );
    return result;
  }

  // POST METHOD
  Future<Response> post(
    String api,
    String? authToken,
    CancelToken? cancelToken, {
    Map<String, String>? customHeaders,
    dynamic reqBody,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    Options? options,
  }) async {
    var url = ApiConst.baseURL + api;
    var headers = hheaders(authToken ?? "", customHeaders);
    var result = await dio.post(
      url,
      data: reqBody,
      options: options ?? Options(headers: headers),
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
    );
    return result;
  }

  // PUT METHOD
  Future<Response> put(
    String api,
    String? authToken,
    CancelToken? cancelToken, {
    Map<String, String>? customHeaders,
    dynamic reqBody,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    Options? options,
  }) async {
    var url = ApiConst.baseURL + api;
    var headers = hheaders(authToken ?? "", customHeaders);
    var result = await dio.put(
      url,
      data: reqBody,
      options: options ?? Options(headers: headers),
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
    );
    return result;
  }

  // DELETE METHOD
  Future<Response> delete(
    String api,
    String? authToken,
    CancelToken? cancelToken, {
    Map<String, String>? customHeaders,
    Options? options,
  }) async {
    var url = ApiConst.baseURL + api;
    var headers = hheaders(authToken ?? "", customHeaders);
    var result = await dio.delete(
      url,
      options: options ?? Options(headers: headers),
      cancelToken: cancelToken,
    );
    return result;
  }

  // POST METHOD
  Future<Response> download(
    String downloadUrl,
    String filePath,
    CancelToken? cancelToken, {
    ProgressCallback? onReceiveProgress,
    Options? options,
  }) async {
    var result = await dio.download(
      downloadUrl,
      filePath,
      options: options,
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
    );
    return result;
  }

  // HANDLE DIO EXCEPTION
  Failure handleDioException(DioException e) {
    if (e.type == DioExceptionType.connectionError) {
      debugPrint("resultError =>> Something went wrong");
      return const DatabaseFailure("Error : Something went wrong");
    } else if (e.type == DioExceptionType.sendTimeout) {
      debugPrint("resultError =>> Sent Timeout");
      return const DatabaseFailure("Error : Sent Timeout");
    } else if (e.type == DioExceptionType.receiveTimeout) {
      debugPrint("resultError =>> Receive Timeout");
      return const DatabaseFailure("Error : Receive Timeout");
    } else if (e.type == DioExceptionType.connectionTimeout) {
      debugPrint("resultError =>> Connection Timeout");
      return const DatabaseFailure("Error : Connection Timeout");
    } else if (e.type == DioExceptionType.badResponse) {
      debugPrint("resultError =>> ${e.response!.statusCode}");
      if (e.response!.statusCode! >= 400) {
        var data = e.response!.data;
        var msg = data["detail"];
        debugPrint("resultError =>> $msg");
        return DatabaseFailure("Error : $msg");
      } else {
        debugPrint("resultError =>> $e");
        return DatabaseFailure("Error : ${e.response!.statusCode}");
      }
    } else {
      debugPrint("resultError =>> $e");
      return DatabaseFailure("Error : ${e.response!.statusCode}");
    }
  }

  // HANDLE CATCH
  Failure handleCatch(e) {
    debugPrint("resultError =>> $e");
    return ServerFailure("Error : $e");
  }

  // HANDLE HEADERS
  Map<String, String> hheaders(
      String authToken, Map<String, String>? customHeaders) {
    if (customHeaders == null || customHeaders.isEmpty) {
      return {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      };
    } else {
      return customHeaders;
    }
  }
}
