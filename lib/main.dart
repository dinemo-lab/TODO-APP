import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:to_doproject/pages/home_page.dart';
//import 'package:hive/hive.dart';

void main() async {
  await Hive.initFlutter();
  // ignore: unused_local_variable
  var box = await Hive.openBox('myBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.purple, brightness: Brightness.dark),
          // textTheme: const TextTheme(
          //   displayLarge: TextStyle(
          //     fontSize: 35,
          //     fontWeight: FontWeight.bold,
          //   ),
          // )),
        ));
  }
}
