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
  /*
      Unlike normal final fields, you do not have to initialize the field in its declaration or in the constructor initialization list. 
      You can assign to it later at runtime. 
      But you can only assign to it once, and that fact is checked at runtime. 
      If you try to assign to it more than once — like calling both heat() and chill() here — the second assignment throws an exception. 
      This is a great way to model state that gets initialized eventually and is immutable afterwards.
      */
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,

    // Starts running this animation in the forward direction, and restarts the animation when it completes.
  )..repeat(reverse: true);

  // This is the function that is called when the animation is started.
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    // Begin the animation at the current value of the offset property.
    begin: Offset.zero,

    // End the animation at the target value.
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,

    // A cubic animation that starts slowly and accelerates the end slowly.
    curve: Curves.easeInOutSine,
  ));

  /*
  [Dispose Method].

  Called when this object is removed from the tree permanently.

  The framework calls this method when this State object will never build again. 
  After the framework calls dispose, the State object is considered unmounted and the mounted property is false. 
  It is an error to call setState at this point. 
  This stage of the lifecycle is terminal: there is no way to remount a State object that has been disposed.

  Subclasses should override this method to release any resources retained by this object (e.g., stop any active animations).

  If a State's build method depends on an object that can itself change state, 
  for example a ChangeNotifier or Stream, or some other object to which one can subscribe to receive notifications, 
  then be sure to subscribe and unsubscribe properly in initState, didUpdateWidget, and dispose:

  In initState, subscribe to the object.
  In didUpdateWidget unsubscribe from the old object and subscribe to the new one if the updated widget configuration requires replacing the object.
  In dispose, unsubscribe from the object.
  Implementations of this method should end with a call to the inherited method, as in super.dispose().
*/
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
