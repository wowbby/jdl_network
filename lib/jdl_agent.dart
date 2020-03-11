import 'package:dio/dio.dart';

import 'jdl_api.dart';

typedef JDLNetworkProgressCallback = void Function(int count, int total);

class JDLNetworkAgent {
   final Dio _dio = Dio(BaseOptions());
   final LogInterceptor _logInterceptor = LogInterceptor(responseBody: true,requestBody: true);

  void addInterceptor(Interceptor interceptor){
    if(interceptor == null) return;
    _dio.interceptors.add(interceptor);
  }

   void closeLog(){
    _dio.interceptors.remove(_logInterceptor);
  }
   void openLog(){
    _dio.interceptors.add(_logInterceptor);
  }
   void removeInterceptor(Interceptor interceptor){
    if(interceptor == null) return;
    _dio.interceptors.remove(interceptor);
  }
    Future<Response> request(JDLApi api,
      {JDLNetworkProgressCallback onSendProgress,
      JDLNetworkProgressCallback onReceiveProgress,CancelToken cancelToken}) async {
    _resetBaseOptions(api);
    _resetTransformer(api);
    return _dio.request(api.path,
        data: api.requestData,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,cancelToken: cancelToken);
  }

    String _coverMethod(JDLRequestMethod method) {
    if (method == JDLRequestMethod.GET) {
      return 'get';
    }
    if (method == JDLRequestMethod.POST) {
      return 'post';
    }
    if (method == JDLRequestMethod.DELETE) {
      return 'delete';
    }
    if (method == JDLRequestMethod.PUT) {
      return 'put';
    }
    if (method == JDLRequestMethod.DELETE) {
      return 'delete';
    }
    if (method == JDLRequestMethod.PATCH) {
      return 'patch';
    }

    return 'get';
  }

    ResponseType _coverResponseType(JDLResponseType type) {
    if (type == JDLResponseType.JSON) {
      return ResponseType.json;
    }
    if (type == JDLResponseType.STREAM) {
      return ResponseType.stream;
    }
    if (type == JDLResponseType.PLAIN) {
      return ResponseType.plain;
    }
    return ResponseType.bytes;
  }

   void _resetBaseOptions(JDLApi api) {
    if (api.method != null) {
      _dio.options.method = _coverMethod(api.method);
    }
    if (api.connectTimeout != null) {
      _dio.options.connectTimeout = api.connectTimeout;
    }
    if (api.receiveTimeout != null) {
      _dio.options.receiveTimeout = api.receiveTimeout;
    }
    if (api.sendTimeout != null) {
      _dio.options.sendTimeout = api.sendTimeout;
    }
    if (api.host != null) {
      _dio.options.baseUrl = api.host;
    }
    if (api.responseType != null) {
      _dio.options.responseType = _coverResponseType(api.responseType);
    }
    if (api.queryParameters != null) {
      _dio.options.queryParameters = api.queryParameters;
    }
    if (api.contentType != null){
      _dio.options.contentType = api.contentType;
    }
  }
    void _resetTransformer(JDLApi api) {

    if (api.transformer != null){
      _dio.transformer = api.transformer;
    }
  }
}
