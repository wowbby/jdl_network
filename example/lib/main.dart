import 'package:flutter/material.dart';
import 'package:jdl_network/jdl_network.dart';
import 'package:jdl_network/jdl_agent.dart';
import 'package:jdl_network/jdl_api.dart';
import 'package:dio/dio.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  static final JDLDefaultApi _api = JDLDefaultApi();

  final JDLNetworkAgent agent = JDLNetworkAgent();

  @override
  Widget build(BuildContext context) {

    JDLNetwork().openLog();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('demo'),
        ),
        body: Center(
          
          child: RaisedButton(onPressed: (){
            testRequest();

          },
            child: Text("测试"),
          ),
          
        ),
      ),
    );
  }


  static testRequest() async{

    Response reponse = await JDLNetwork().request(_api);
  }
}
