import 'package:dio/dio.dart';

import '../utils/constants.dart';
// import '../utils/throttle.dart';

class ServerException implements Exception {
  final String? message;

  ServerException({
    this.message = EXCEPTION_UNKNOWN,
  });

  factory ServerException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        throw ServerException(message: EXCEPTION_CANCEL);
      case DioErrorType.connectTimeout:
        throw ServerException(message: EXCEPTION_CONNECTION_RTO);
      case DioErrorType.receiveTimeout:
        throw ServerException(message: EXCEPTION_RECEIVE_RTO);
      case DioErrorType.response:
        throw _handleError(dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.sendTimeout:
        throw ServerException(message: EXCEPTION_SEND_RTO);
      case DioErrorType.other:
        throw ServerException(message: EXCEPTION_OTHER);
      default:
        throw ServerException(message: EXCEPTION_UNKNOWN);
    }
  }

  static ServerException _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        throw ServerException(message: error['message'] ?? EXCEPTION_UNKNOWN);
      case 401:
        // TODO: Call _logout method
        // _logout();
        throw ServerException(message: EXCEPTION_UNAUTHORIZED);
      case 404:
        throw ServerException(message: EXCEPTION_NOT_FOUND);
      case 405:
        throw ServerException(message: EXCEPTION_METHOD);
      case 415:
        throw ServerException(message: EXCEPTION_MEDIA_TYPE);
      case 500:
        throw ServerException(message: EXCEPTION_ISE);
      default:
        throw ServerException(message: EXCEPTION_UNKNOWN);
    }
  }
  // TODO: Implement logout exception method
  // static void _logout() async {
  //   // throttle of handle logout 🔥
  //   Throttle.throttle('logout_throttle', constDuration(seconds: 5), () {
  //     sl<LoginLogout>().call(NoParams());
  //     if (sl<FlavorConfig>().tenant.isGeneral) {
  //       Get.offAllNamed('/loginUniversal');
  //     } else {
  //       Get.offAllNamed('/login');
  //     }
  //   });
  // }
}

class AuthException implements Exception {
  final String? message;

  AuthException({
    this.message = EXCEPTION_UNKNOWN,
  });

  factory AuthException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        throw AuthException(message: EXCEPTION_CANCEL);
      case DioErrorType.connectTimeout:
        throw AuthException(message: EXCEPTION_CONNECTION_RTO);
      case DioErrorType.receiveTimeout:
        throw AuthException(message: EXCEPTION_RECEIVE_RTO);
      case DioErrorType.response:
        throw _handleError(dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.sendTimeout:
        throw AuthException(message: EXCEPTION_SEND_RTO);
      case DioErrorType.other:
        throw AuthException(message: EXCEPTION_OTHER);
      default:
        throw AuthException(message: EXCEPTION_UNKNOWN);
    }
  }

  static AuthException _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        throw AuthException(message: EXCEPTION_AUTH_INVALID);
      case 404:
        throw AuthException(message: EXCEPTION_NOT_FOUND);
      case 405:
        throw AuthException(message: EXCEPTION_METHOD);
      case 500:
        throw AuthException(message: EXCEPTION_ISE);
      default:
        throw AuthException(message: EXCEPTION_UNKNOWN);
    }
  }
}

class CacheException implements Exception {
  final String? message;

  CacheException({this.message = EXCEPTION_UNKNOWN});
}

class UnknownException implements Exception {
  final String? message;

  UnknownException({this.message});
}

class NotFoundException implements Exception {
  final String? message;

  NotFoundException({this.message});
}
