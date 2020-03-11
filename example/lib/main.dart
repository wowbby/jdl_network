
import 'package:flutter/material.dart';
import 'package:jdl_network/jdl_network.dart';
import 'package:jdl_network/jdl_api.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'toutiao_api.dart';
import 'test_patcher.dart';
import 'weather_model.dart';

void main() {
  runApp(ChangeNotifierProvider<Counter>.value(
      notifier: Counter(1), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _addInterceptor();
    JDLNetwork().registerPatcher(TestPatcher());
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('demo'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('${Provider.of<Counter>(context).count}'),
            RaisedButton(
              onPressed: () {
                Provider.of<Counter>(context).add();
                testRequest();
              },
              child: Text("++"),
            ),
            RaisedButton(
              onPressed: () {
                Provider.of<Counter>(context).sub();
                otherRequest();
              },
              child: Text("--"),
            ),
          ],
        ),
      ),
    );
  }

  void _addInterceptor() {
    JDLNetwork().addInterceptor(Interceptor());
  }

  static testRequest() async {
    JDLDefaultApi api = JDLDefaultApi();
    api.path = '?city=%E5%8C%97%E4%BA%AC&key=599f6b4d7bd529ec90c4d7ac098e7405';
    JDLNetwork.instance.request(api).then((response) {
      

      WeatherResponse res =
          WeatherResponse.fromJson(response.data);

          print(res.toJson());

    }).catchError((error) {
      print(error);
    });
  }

  static otherRequest() async {
    TopApi api = TopApi();

    JDLNetwork.instance.request(api).then((response) {
      print(response.toString());
    }).catchError((error) {
      print(error);
    });
  }
}

class Counter with ChangeNotifier {
  int _count;

  Counter(this._count);

  void add() {
    _count++;
    notifyListeners();
  }

  void sub() {
    _count--;
    notifyListeners();
  }

  get count => _count;
}


