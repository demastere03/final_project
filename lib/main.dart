import 'package:flutter/material.dart';
import 'package:tugas_akhir/main_page/login.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tugas_akhir/product_model/comment_model.dart';

String boxName = 'COMMENTBOX';
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<CommentModel>(CommentModelAdapter());
  await Hive.openBox<CommentModel>(boxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}