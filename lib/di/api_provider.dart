import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/di/network_service.dart';
import 'package:insta_demo/models/response_handler.dart';
import 'package:insta_demo/ui/common/api_client.dart';
import 'package:insta_demo/ui/common/app_exception.dart';
import 'package:insta_demo/ui/common/logger.dart';
import 'package:insta_demo/ui/common/strings.dart';

abstract class BaseApiProvider {
  Future<ResponseHandler> postMethod(String? url, Map<String, dynamic> body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Progress? uploadProgress});

  Future<ResponseHandler> getMethod(String url,
      {Map<String, String>? headers,
      String? contentType,
      Map<String, dynamic>? query,
      Decoder? decoder});

  Future<ResponseHandler> putMethod(String url, Map<String, dynamic> body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Progress? uploadProgress});

  Future<ResponseHandler> patchMethod(String url, Map<String, dynamic> body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Progress? uploadProgress});

  Future<ResponseHandler> requestMethod(String url, String method,
      {Map<String, dynamic> body,
      String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Progress? uploadProgress});

  Future<ResponseHandler> deleteMethod(String url,
      {Map<String, String>? headers,
      String? contentType,
      Map<String, dynamic>? query});
}

class BaseApiProviderImpl extends GetConnect implements BaseApiProvider {
  BaseApiProviderImpl._privateConstructor() {
    onInit();
  }

  BaseApiProviderImpl();

  static final BaseApiProviderImpl _instance =
      BaseApiProviderImpl._privateConstructor();

  static BaseApiProviderImpl get instance => _instance;

  Map<String, String> jsonHeader = {'Content-Type': 'application/json'};
  final NetworkService _networkService = Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = ApiClient.baseUrl;
    httpClient.addResponseModifier((request, response) async {
      AppLogger.getLogger().i(
          '${request.method.toUpperCase()} : ${request.url} \nHeader : ${request.headers}'
          '\nRequest Parameter '
          '\n${request.files?.fields.map((element) => '${element.key} : ${element.value}\n')}');
      AppLogger.getLoggerNoStack().i(
          'Response Parameter \n${response.statusCode} : ${response.statusText}\n${response.bodyString?.trim()}');
      return response; // add this
    });
  }

  @protected
  @override
  Future<ResponseHandler> postMethod(String? url, Map<String, dynamic> body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      decoder,
      uploadProgress}) async {
    debugPrint('url: $url\nrequest: $body');
    if (await _networkService.isConnected()) {
      try {
        FormData formData = FormData(body);
        Response<ResponseHandler> response = await post(url, formData,
            contentType: contentType,
            headers: headers,
            decoder: (data) => decoderValidate(data),
            query: query,
            uploadProgress: uploadProgress);
        return response.body ??
            ResponseHandler.error(
                response.statusCode ?? 400, response.bodyString ?? '');
      } catch (exception) {
        if (exception is SocketException) {
          throw AppException(StringConstants.noInternetConnection);
        }
        rethrow;
      }
    } else {
      throw AppException(StringConstants.noInternetConnection);
    }
  }

  @protected
  @override
  Future<ResponseHandler> getMethod(String url,
      {Map<String, String>? headers,
      String? contentType,
      Map<String, dynamic>? query,
      decoder}) async {
    debugPrint('url: ${httpClient.baseUrl}$url');
    if (await _networkService.isConnected()) {
      try {
        Response<ResponseHandler> response = await get(url,
            contentType: contentType,
            headers: headers ?? jsonHeader,
            decoder: (data) => decoderValidate(data),
            query: query);
        //TODO : For testing

        return ResponseHandler.error(
            response.statusCode ?? 400, response.bodyString ?? '');
      } catch (exception) {
        if (exception is SocketException) {
          throw AppException(StringConstants.noInternetConnection);
        } else if (exception is TypeError) {
          throw AppException(errSomethingWentWrong);
        } else {
          rethrow;
        }
      }
    } else {
      throw AppException(StringConstants.noInternetConnection);
    }
  }

  @protected
  @override
  Future<ResponseHandler> putMethod(String url, Map<String, dynamic> body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      decoder,
      uploadProgress}) async {
    debugPrint('url: ${httpClient.baseUrl}$url\nrequest: $body');
    if (await _networkService.isConnected()) {
      try {
        FormData formData = FormData(body);
        Response<ResponseHandler> response = await put(url, formData,
            contentType: contentType,
            headers: headers ?? jsonHeader,
            decoder: (data) => ResponseHandler.fromJson(data),
            query: query,
            uploadProgress: uploadProgress);
        return response.body ??
            ResponseHandler.error(
                response.statusCode ?? 400, response.bodyString ?? '');
      } catch (exception) {
        if (exception is SocketException) {
          throw AppException(StringConstants.noInternetConnection);
        }
        rethrow;
      }
    } else {
      throw AppException(StringConstants.noInternetConnection);
    }
  }

  @protected
  @override
  Future<ResponseHandler> patchMethod(String url, Map<String, dynamic> body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      decoder,
      uploadProgress}) async {
    debugPrint('url: ${httpClient.baseUrl}$url\nrequest: $body');
    if (await _networkService.isConnected()) {
      try {
        FormData formData = FormData(body);
        Response<ResponseHandler> response = await patch(url, formData,
            contentType: contentType,
            headers: headers ?? jsonHeader,
            query: query,
            decoder: (data) => ResponseHandler.fromJson(data),
            uploadProgress: uploadProgress);
        return response.body ??
            ResponseHandler.error(
                response.statusCode ?? 400, response.bodyString ?? '');
      } catch (exception) {
        if (exception is SocketException) {
          throw AppException(StringConstants.noInternetConnection);
        }
        rethrow;
      }
    } else {
      throw AppException(StringConstants.noInternetConnection);
    }
  }

  @protected
  @override
  Future<ResponseHandler> requestMethod(String url, String method,
      {Map<String, dynamic> body = const {},
      String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      uploadProgress}) async {
    debugPrint('url: ${httpClient.baseUrl}$url\nrequest: $body');
    if (await _networkService.isConnected()) {
      try {
        Response<ResponseHandler> response = await request(url, body.toString(),
            contentType: contentType,
            headers: headers ?? jsonHeader,
            query: query,
            decoder: (data) => ResponseHandler.fromJson(data),
            uploadProgress: uploadProgress);
        return response.body ??
            ResponseHandler.error(
                response.statusCode ?? 400, response.bodyString ?? '');
      } catch (exception) {
        if (exception is SocketException) {
          throw AppException(StringConstants.noInternetConnection);
        }
        rethrow;
      }
    } else {
      throw AppException(StringConstants.noInternetConnection);
    }
  }

  @protected
  @override
  Future<ResponseHandler> deleteMethod(String url,
      {Map<String, String>? headers,
      String? contentType,
      Map<String, dynamic>? query}) async {
    debugPrint('url: ${httpClient.baseUrl}$url');
    if (await _networkService.isConnected()) {
      try {
        Response<ResponseHandler> response = await delete(url,
            contentType: contentType,
            headers: headers ?? jsonHeader,
            decoder: (data) => ResponseHandler.fromJson(data),
            query: query);
        return response.body ??
            ResponseHandler.error(
                response.statusCode ?? 400, response.bodyString ?? '');
      } catch (exception) {
        if (exception is SocketException) {
          throw AppException(StringConstants.noInternetConnection);
        }
        rethrow;
      }
    } else {
      throw AppException(StringConstants.noInternetConnection);
    }
  }

  T manageResponse<T>(Response<T> response) {
    debugPrint('Response: ${jsonEncode(response.body)}');
    if (response.status.isOk && response.body != null) {
      return response.body!;
    } else if (response.body != null &&
        response.body is ResponseHandler &&
        ((response.body as ResponseHandler).error ?? false)) {
      throw AppException((response.body as ResponseHandler).message ?? '');
    } else {
      throw AppException('Something went wrong! Please try again');
    }
  }
}

ResponseHandler decoderValidate(dynamic data) {
  try {
    return ResponseHandler.fromJson(data);
  } catch (e, s) {
    debugPrint('$e, $s');
    rethrow;
  }
}
