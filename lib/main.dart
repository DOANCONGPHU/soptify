import 'package:flutter/material.dart';
import 'package:soptify/navigator/tabbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        
        selectedLabelStyle: TextStyle(
          fontSize: 15
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 15
        )
        ),
      ),

      home: const Tabbar(),
      debugShowCheckedModeBanner: false,
    );
    
  }
}
