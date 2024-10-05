import 'package:flutter/material.dart';

class HomeControllerPage extends StatefulWidget {
  const HomeControllerPage({super.key});

  @override
  State<HomeControllerPage> createState() => _HomeControllerPageState();
}

class _HomeControllerPageState extends State<HomeControllerPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("HomeController"),
    );
  }
}
