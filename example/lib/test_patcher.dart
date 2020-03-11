
import 'package:jdl_network/jdl_api.dart';
import 'package:jdl_network/jdl_patcher.dart';


class TestPatcher implements JDLNetworkPatcher{
  @override
  String identifier = 'TestPatcher';

  @override
  int priority = 0;

  @override
  bool isNeedPatch(JDLApi api) {
    
    if (api.patchParameters == null){

      return false;
    }

    var value = api.patchParameters['patcherKey'];

    if(value != null){

      return true;
    }

    return false;
  }

  @override
  void patch(JDLApi api) {
    api.path = '?type=&key=152d079c29e40263bdaf27a1a7b7d63d';
  }


}