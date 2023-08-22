import 'dart:developer';

import 'package:dio/dio.dart';

import '../core/errors/exceptions.dart';

class BaseApi {
  final Dio dio;

  BaseApi(this.dio);

  Future<Response<T>> get<T>(
    String uri, {
    bool? isAuth = false,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return await dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress
      );
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      if (e is DioError) {
        if (isAuth!) {
          throw AuthException.fromDioError(e);
        } else {
          throw ServerException.fromDioError(e);
        }
      } else {
        rethrow;
      }
    }
  }

  Future<Response<T>> post<T>(
     String uri, {
    data,
    bool? isAuth = false,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      if (e is DioError) {
        if (isAuth!) {
          throw AuthException.fromDioError(e);
        } else {
          throw ServerException.fromDioError(e);
        }
      } else {
        rethrow;
      }
    }
  }

  Future<Response<T>> delete<T>(String uri,
      {data,
      bool? isAuth = false,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) async {
    try {
      return await dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      if (e is DioError) {
        if (isAuth!) {
          throw AuthException.fromDioError(e);
        } else {
          throw ServerException.fromDioError(e);
        }
      } else {
        rethrow;
      }
    }
  }

  Future<Response<T>> put<T>(
    String uri, {
    data,
    bool? isAuth = false,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return await dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      if (e is DioError) {
        if (isAuth!) {
          throw AuthException.fromDioError(e);
        } else {
          throw ServerException.fromDioError(e);
        }
      } else {
        rethrow;
      }
    }
  }
}