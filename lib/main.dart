import 'package:expense_app/bloc/expense_bloc.dart';
import 'package:expense_app/database/expenss_db.dart';
import 'package:expense_app/screen/homepage.dart';
import 'package:expense_app/screen/login_page.dart';
import 'package:expense_app/screen/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ExpenseBloc(db: AppDataBase.db),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
