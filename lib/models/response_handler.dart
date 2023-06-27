import 'dart:convert';

import 'package:insta_demo/models/status_helper.dart';
import 'package:insta_demo/ui/common/strings.dart';
class ResponseHandler<T> {
  ResponseHandler({
    this.error,
    this.status,
    this.message,
    this.result,
  });

  bool? error;
  int? status;
  String? message;
  dynamic result;

  factory ResponseHandler.fromRawJson(String str) =>
      ResponseHandler.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseHandler.error(int statusCode, String errorMessage) {
    return ResponseHandler(
        error: true, status: statusCode, message: errorMessage, result: null);
  }

  factory ResponseHandler.fromJson(Map<String, dynamic> json) {
    return ResponseHandler(
      error: json['error'] == null
          ? null
          : json['error'] is bool
              ? json['error']
              : json['error'].toLowerCase() == 'true',
      status: json['status'],
      message: json['message'],
      result: json['response'],
    );
  }

  factory ResponseHandler.fromJsonMock(dynamic json,
      {int status = 0, String message = errSomethingWentWrong}) {
    if (json is List) {
      return ResponseHandler(
        error: false,
        status: status,
        message: message,
        result: json,
      )..error = StatusHelper.hasError(status);
    }

    return ResponseHandler(
      error: json['error'] == null
          ? null
          : json['error'] is bool
              ? json['error']
              : json['error'].toLowerCase() == 'true',
      status: json['status'] ?? status,
      message: json['message'] ?? message,
      result: json['response'] ?? json,
    );
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'status': status,
        'message': message,
        'response': result,
      };

  bool get hasError =>
      StatusHelper.hasError(status ?? StatusHelper.defaultErrCode);

  Y getResult<Y>() {
    return result as Y;
  }
}
