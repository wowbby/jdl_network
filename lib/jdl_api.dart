import 'package:dio/dio.dart';

abstract class JDLApi with JDLServerInfo, JDLRequestInfo,JDLTransformer,JDLRequestPatchInfo {}
class JDLDefaultApi implements JDLApi {
  @override
  int connectTimeout = 5000;

  @override
  String contentType;
  @override
  Map<String, dynamic> queryParameters;

  @override
  Map<String, dynamic> headers;

  @override
  String host = 'http://apis.juhe.cn/simpleWeather/query';

  @override
  JDLRequestMethod method = JDLRequestMethod.GET;

  @override
  String path;

  @override
  int receiveTimeout = 5000;

  @override
  JDLResponseType responseType = JDLResponseType.JSON;

  @override
  var requestData;

  @override
  DefaultTransformer transformer;

  @override
  int sendTimeout = 5000;

  @override
  Map<String, String> patchParameters;

}
abstract class JDLRequestPatchInfo{
  Map<String,String> patchParameters;
}
abstract class JDLRequestInfo<T> {
  String path;
  JDLRequestMethod method;
  T requestData;
  Map<String, dynamic> headers;
  Map<String, dynamic> queryParameters;
  int connectTimeout;
  int receiveTimeout;
  int sendTimeout;
  String contentType;
  JDLResponseType responseType;
}

enum JDLRequestMethod { GET, POST, PUT, DELETE, HEAD, PATCH }


abstract class JDLTransformer {
  DefaultTransformer transformer;
}

enum JDLResponseType { JSON, STREAM, PLAIN ,BYTES}

abstract class JDLServerInfo {
  String host;
}
