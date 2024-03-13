import 'package:flutter/material.dart';

class ExampleThree extends StatefulWidget {
  const ExampleThree({Key? key}) : super(key: key);

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> heightAnimation;
  late Animation<double> widthAnimation;
  late Animation<double> textSizeAnimation;
  late Animation<Color?> colorAnimation;

  @override
  void dispose() {
   animationController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    widthAnimation =
        Tween<double>(begin: 120, end: 200).animate(animationController);
    textSizeAnimation =
        Tween<double>(begin: 14, end: 50).animate(animationController);
    heightAnimation =
        Tween<double>(begin: 50, end: 200).animate(animationController);
    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.red)
        .animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });

    animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Animation",
          style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: SizedBox(
          height: heightAnimation.value,
          width: widthAnimation.value,
          child: Center(
            child: Text(
              "Hello Flutter World",
              style: TextStyle(
                color: colorAnimation.value,
                fontSize: textSizeAnimation.value,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
