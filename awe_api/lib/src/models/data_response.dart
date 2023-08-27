import 'package:awe_api/awe_api.dart';

abstract class DataResponse<T> {
  T? data;
  APIError? error;

  DataResponse({this.data, this.error});
}
