import 'package:flutter/material.dart';
import 'package:nav_bars/constants.dart';
import 'package:nav_bars/nav_bar_1/nav_bar_1.dart';
import 'package:nav_bars/nav_bar_2/nav_bar_2.dart';
import 'package:nav_bars/nav_bar_3/nav_bar_3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: AppColors.orangePrimaryColor),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentNavBar = 0;

  void setNavBar(int value) {
    currentNavBar = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    List<Widget> navBars = [
      BottomNavBar1(w: w),
      BottomNavBar2(w: w),
      BottomNavBar3(w: w)
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("App Bars"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  navBars.length,
                  (index) => ElevatedButton(
                      onPressed: () => setNavBar(index),
                      child: Text("NavBar ${index + 1}"))),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Bottom Navigation Bar ${currentNavBar + 1}',
            ),
          ],
        ),
      ),
      bottomNavigationBar: navBars[currentNavBar],
    );
  }
}
