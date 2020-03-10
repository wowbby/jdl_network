library jdl_network;

import 'package:dio/dio.dart';
import 'jdl_api.dart';
import 'jdl_agent.dart';
import 'jdl_patcher.dart';
class JDLNetwork {

  JDLNetworkPatcherManager _patcherManager = JDLNetworkPatcherManager();

  factory JDLNetwork() =>_getInstance();
  static JDLNetwork get instance => _getInstance();
  static JDLNetwork _instance;
  JDLNetwork._internal();
  static JDLNetwork _getInstance() {
    if (_instance == null) {
      _instance = new JDLNetwork._internal();
    }
    return _instance;
  }

  void registerPatcher(JDLNetworkPatcher patcher){
    _patcherManager.registerPatcher(patcher);
  }

  void unRegisterPatcher(JDLNetworkPatcher patcher){
    _patcherManager.unRegisterPatcher(patcher);
  }
  void addInterceptor(Interceptor interceptor){
    JDLNetworkAgent.addInterceptor(interceptor);
  }

  void openLog(){
    JDLNetworkAgent.openLog();
  }
  void removeInterceptor(Interceptor interceptor){
    JDLNetworkAgent.removeInterceptor(interceptor);
  }
   Future<Response> request(JDLApi api,
      {JDLNetworkProgressCallback onSendProgress,
        JDLNetworkProgressCallback onReceiveProgress,CancelToken cancelToken}) async {
    return JDLNetworkAgent.request(api,onSendProgress:onSendProgress,onReceiveProgress:onReceiveProgress,cancelToken:cancelToken);
  }


}