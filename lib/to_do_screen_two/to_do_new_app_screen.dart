import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do_app/to_do_screen_two/new_home_screen.dart';

class ToDoNewAppScreen extends StatefulWidget {
  const ToDoNewAppScreen({Key? key}) : super(key: key);

  @override
  State<ToDoNewAppScreen> createState() => _ToDoNewAppScreenState();
}

class _ToDoNewAppScreenState extends State<ToDoNewAppScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
      const Duration(seconds: 4),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NewHomeScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Center(
                child: Text(
                  "To Do",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ),
              Center(
                child: Text(
                  "App",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
