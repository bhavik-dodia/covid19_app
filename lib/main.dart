import 'package:covid19_app/app/services/api.dart';
import 'package:covid19_app/app/services/api_service.dart';
import 'package:covid19_app/app/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/repositories/data_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<DataRepository>(
      create: (_) => DataRepository(apiService: APIService(API.sandbox())),
      child: MaterialApp(
        title: 'Coronavirus Tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.blueAccent,
          primaryColor: Colors.blueAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData.dark().copyWith(accentColor: Colors.blueAccent,
          primaryColor: Colors.blueAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,),
        home: Dashboard(),
      ),
    );
  }
}