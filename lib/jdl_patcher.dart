
import 'jdl_api.dart';


abstract class JDLNetworkPatcher{

  int priority;
  String identifier;
  bool isNeedPatch(JDLApi api);
  void patch(JDLApi api);

}

class JDLNetworkPatcherManager{

  Map<String,JDLNetworkPatcher> patchers = {};

  void registerPatcher(JDLNetworkPatcher patcher){
    if (patcher == null || patcher.identifier == null){

      return;
    }
    patchers[patcher.identifier] = patcher;
  }

  void unRegisterPatcher(JDLNetworkPatcher patcher){
    if (patcher == null || patcher.identifier == null){

      return;
    }
    patchers.remove(patcher.identifier);
  }

  void patch(JDLApi api){
    patchers.forEach((key,patcher){
      if(patcher.isNeedPatch(api))
        patcher.patch(api);
    });

  }
}