import 'package:dio/src/transformer.dart';
import 'package:jdl_network/jdl_api.dart';


class TopApi implements JDLApi{
  @override
  int connectTimeout;

  @override
  String contentType;

  @override
  Map<String, dynamic> headers;

  @override
  String host = 'http://v.juhe.cn/toutiao/index';

  @override
  JDLRequestMethod method = JDLRequestMethod.GET;

  @override
  Map<String, String> patchParameters = {
    'patcherKey':'1'
  };

  @override
  String path;

  @override
  Map<String,dynamic > queryParameters;

  @override
  int receiveTimeout;

  @override
  var requestData;

  @override
  JDLResponseType responseType;

  @override
  int sendTimeout;

  @override
  DefaultTransformer transformer;

}