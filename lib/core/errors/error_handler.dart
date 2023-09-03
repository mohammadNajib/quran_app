import '../core_importer.dart';

class ErrorHandler {
  static Response? handleDioError(DioException error, RequestOptions options) {
    if (error.response == null) {
      return Response(statusCode: serviceUnavailableError, requestOptions: options);
    } else {
      if (error.type == DioExceptionType.unknown || error.type == DioExceptionType.badResponse) {
        if (error is SocketException) return error.response;
        if (error.type == DioExceptionType.badResponse) {
          switch (error.response!.statusCode) {
            case badRequestError:
              return error.response;
            case unauthorizedError:
              return error.response;
            case forbiddenError:
              return error.response;
            case notFoundError:
              return error.response;
            case conflictError:
              return error.response;
            case internalServerError:
              return error.response;
            default:
              return error.response;
          }
        } else if (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.sendTimeout ||
            error.type == DioExceptionType.receiveTimeout) {
          return error.response;
        }
        if (error.type == DioExceptionType.cancel) return error.response;
        return error.response;
      }
      return error.response;
    }
  }
}
