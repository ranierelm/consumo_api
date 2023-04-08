import 'package:flutter/material.dart';
import 'package:study_api/app/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), // ThemeData
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
