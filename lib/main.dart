import 'package:flutter/material.dart';
import 'package:flutter_firebase/screen/display.dart';
import 'package:flutter_firebase/screen/formscreen.dart';

void main() {
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
      home: const MyHomePage(title: 'Flutter Firebase'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: const TabBarView(children: [
          FormScreen(),
          DisplayScreen(),
        ]),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        bottomNavigationBar: const TabBar(
          tabs: [
            Tab(text: "ບັນທຶກຄະແນນ"),
            Tab(text: "ລາຍຊື່ນັກຮຽນ"),
          ],
        ),
      ),
    );
  }
}
