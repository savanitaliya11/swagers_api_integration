import 'package:flutter/material.dart';
import 'package:swagger_api_integration/view/get_notice_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GetNoticeData(),
    );
  }
}
