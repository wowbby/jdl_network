library jdl_network;

import 'package:dio/dio.dart';
import 'jdl_api.dart';
import 'jdl_agent.dart';
import 'jdl_patcher.dart';

class JDLNetwork {
  final JDLNetworkPatcherManager _patcherManager = JDLNetworkPatcherManager();

  final JDLNetworkAgent _agent = JDLNetworkAgent();

  factory JDLNetwork() => _getInstance();
  static JDLNetwork get instance => _getInstance();
  static JDLNetwork _instance;
  JDLNetwork._internal();
  static JDLNetwork _getInstance() {
    if (_instance == null) {
      _instance = new JDLNetwork._internal();
    }
    return _instance;
  }

  /// 注册修补器，修补器是在发起请求前对Api对象进行一些预处理，例如添加公共参数，公共请求头等
  void registerPatcher(JDLNetworkPatcher patcher) {
    _patcherManager.registerPatcher(patcher);
  }

  /// 取消注册修补器
  void unRegisterPatcher(JDLNetworkPatcher patcher) {
    _patcherManager.unRegisterPatcher(patcher);
  }

  /// 添加拦截器
  void addInterceptor(Interceptor interceptor) {
    _agent.addInterceptor(interceptor);
  }

  /// 移除拦截器
  void removeInterceptor(Interceptor interceptor) {
    _agent.removeInterceptor(interceptor);
  }

  /// 打开日志
  void openLog() {
    _agent.openLog();
  }

  /// 关闭日志
  void closeLog() {
    _agent.closeLog();
  }

  ///发起网络请求
  Future<Response> request(JDLApi api,
      {JDLNetworkProgressCallback onSendProgress,
      JDLNetworkProgressCallback onReceiveProgress,
      CancelToken cancelToken}) async {
    _patcherManager.patch(api);
    return _agent.request(api,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken);
  }
}
