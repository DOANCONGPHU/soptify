import 'package:flutter/material.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<ExploreView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("libara"),
      ),
    );
  }
}