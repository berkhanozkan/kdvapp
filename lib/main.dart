import 'package:flutter/material.dart';
import 'package:kdv_app/pages/kdv_dahil.dart';
import 'package:kdv_app/pages/kdv_haric.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  final screens = [
    KdvDahilFiyatScreen(),
    KDVHaricFiyatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',

      //  theme: ThemeData.dark(),

      home: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.amber.shade100,
          //   title: Text(
          //     'Material App Bar',
          //     style: TextStyle(color: Colors.black),
          //   ),
          // ),
          resizeToAvoidBottomInset: true,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.amber.shade100,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.black,
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            selectedFontSize: 16,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.calculate), label: 'Kdv Dahil'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calculate), label: 'Kdv Hariç'),
            ],
          ),
          body: screens[currentIndex]),
    );
  }
}
