import 'package:dio/dio.dart';

extension DioUtils on Map<String, dynamic> {
  Options? get dioOptions {
    return Options(headers: this);
  }
}
