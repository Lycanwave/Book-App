import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocibo/materialColor.dart';
import 'package:vocibo/provider/orderListProvider.dart';
import 'package:vocibo/screens/home_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => OrderListProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Palette.kToDark,
          ),
          home: const HomeScreen(),
        ));
  }
}
