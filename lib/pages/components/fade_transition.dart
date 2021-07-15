// Not using for now.
import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class MySlideTransitionWidget extends StatefulWidget {
  const MySlideTransitionWidget({Key? key}) : super(key: key);

  @override
  State<MySlideTransitionWidget> createState() =>
      _MySlideTransitionWidgetState();
}

/// This is the private State class that goes with MySlideTransitionWidget.
class _MySlideTransitionWidgetState extends State<MySlideTransitionWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOutSine,
  ));

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "BufferOverflow",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
