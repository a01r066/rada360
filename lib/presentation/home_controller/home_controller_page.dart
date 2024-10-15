import 'package:flutter/material.dart';
import 'package:rada360/presentation/home_controller/home_controller_cubit.dart';

class HomeControllerPage extends StatefulWidget {
  const HomeControllerPage({super.key});

  @override
  State<HomeControllerPage> createState() => _HomeControllerPageState();
}

class _HomeControllerPageState extends State<HomeControllerPage> {
  HomeControllerCubit homeControllerCubit = HomeControllerCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text("HomeController"),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  _buildBottomNavBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.call),
          label: 'Calls',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera),
          label: 'Camera',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chats',
        ),
      ],
    );
  }
}
