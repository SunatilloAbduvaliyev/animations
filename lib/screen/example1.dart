import 'dart:math';

import 'package:flutter/material.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween<double>(begin:0, end: 4 * pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
        reverseCurve: Curves.linear,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {});
    _controller.forward();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Transform.rotate",
        style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            onPressed: () {
              _controller.reverse();
            },
            icon: const Icon(
              color: Colors.white,
              Icons.restart_alt,
              size: 30,
            ),
          ),
        ],
      ),
      body: Center(
        child: Transform.rotate(
          angle: _animation.value,
          child:  Container(
            color: Colors.blue,
            height: 150,
            width: 150,
          ),
        ),
      ),
    ));
  }
}
