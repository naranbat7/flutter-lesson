import 'package:dio/dio.dart';

class CustomInterceptors extends InterceptorsWrapper {
  CustomInterceptors()
      : super(
          onRequest: (options, handler) {
            print("On request");
            if (options.uri.toString() == "https://pub.dev/packages/dio") {
              return handler.reject(DioError(requestOptions: options, type: DioErrorType.cancel));
            }
            return handler.next(options);
          },
          onResponse: (response, handler) {
            print("On response");
            return handler.next(response);
          },
          onError: (DioError e, handler) {
            print("On error");
            return handler.next(e);
          },
        );
}
