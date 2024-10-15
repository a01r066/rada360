import 'package:flutter/material.dart';

class CallSupportPage extends StatefulWidget {
  const CallSupportPage({super.key});

  @override
  State<CallSupportPage> createState() => _CallSupportPageState();
}

class _CallSupportPageState extends State<CallSupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
    );
  }

  _buildBody() {}
}
