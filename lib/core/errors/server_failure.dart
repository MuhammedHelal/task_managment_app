/*
class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});
  factory ServerFailure.fromDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection timeout with server');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send timeout with server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive timeout with server');
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'Bad certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.badResponse(
            statusCode: error.response!.statusCode!);
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Request cancel');
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: 'Connection error');
      case DioExceptionType.unknown:
        return ServerFailure(errMessage: 'Unknown error');
    }
  }

  factory ServerFailure.badResponse({required int statusCode}) {
    switch (statusCode) {
      case 400:
        return ServerFailure(errMessage: 'Bad request');
      case 401:
        return ServerFailure(errMessage: 'Unauthorized');
      case 403:
        return ServerFailure(errMessage: 'Forbidden');
      case 404:
        return ServerFailure(errMessage: 'Request not found');
      case 500:
        return ServerFailure(errMessage: 'Internal server error');
      default:
        return ServerFailure(
            errMessage: 'Something went wrong, Please try later');
    }
  }
}
*/