import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:website_by_flutter/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(320, 568),
      builder: (BuildContext context, Widget? child) {
        return const MaterialApp(debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: HomeScreen(),
        );
      },
    );
  }
}

