import 'package:flutter/material.dart';

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  bool isBigger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Animation",
            style: TextStyle(color: Colors.white),),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AnimatedContainer(
                height: isBigger? 100:100,
                width: isBigger ? 300 : 100,
                duration: const Duration(seconds: 1),
                curve: Curves.linear,
                decoration: const BoxDecoration(
                 color: Colors.blue
                ),
                child: InkWell(
                  onTap:(){
                    isBigger = !isBigger;
                    setState(() {});
                  }
                ),
              ),
            ),
          ],
        ));
  }
}
