import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomePage(),
    ) ;

  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var subscription ;

 Future getNetworkconnection () async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
        print("Mobile connected");
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("Wifi connected");
    }else{
      print("No internet connected");
    }
  }


  @override
  void initState() {
    subscription = Connectivity().onConnectivityChanged.listen((result) {
     getNetworkconnection();
    }) ;
    super.initState();
  }

  @override
  void dispose() {
    subscription?.cancel() ;
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(
          title: Text("Connection check"),
        ),
      body: Container(
        child: Column(
          children: [
              Text("Net connection check")
          ],
        ),
      ),
    ));
  }


}



