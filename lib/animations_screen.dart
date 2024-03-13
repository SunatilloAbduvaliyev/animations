import 'package:animatsiyalar/screen/example1.dart';
import 'package:animatsiyalar/screen/example2.dart';
import 'package:animatsiyalar/screen/example3.dart';
import 'package:animatsiyalar/screen/example4.dart';
import 'package:animatsiyalar/screen/example5.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationsScreen extends StatefulWidget {
  const AnimationsScreen({super.key});

  @override
  State<AnimationsScreen> createState() => _AnimationsScreenState();
}

class _AnimationsScreenState extends State<AnimationsScreen> {
  List<Widget> screen = [
    const ExampleOne(),
    const ExampleTwo(),
    const ExampleThree(),
    const ExampleFour(),
    const ExampleFive(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ...List.generate(
              screen.length,
              (index) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Ink(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => screen[index]),
                      );
                    },
                    child:  Center(
                      child: Text(
                        "Example ${(index+1).toString()}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
