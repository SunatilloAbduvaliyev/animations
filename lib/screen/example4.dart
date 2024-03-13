import 'package:flutter/material.dart';

class ExampleFour extends StatefulWidget {
  const ExampleFour({super.key});

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  bool isOpacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isOpacity = !isOpacity;
            });
          },
          child: AnimatedContainer(
            height: 150,
            width: 150,
            duration: const Duration(seconds: 3),
            decoration:
            BoxDecoration(color: isOpacity ? Colors.green : Colors.green.withOpacity(0.01)),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            isOpacity = !isOpacity;
          });
        },
        child: Icon(
          isOpacity? Icons.visibility_off_outlined : Icons.remove_red_eye,
        ),
      ),
    );
  }
}
