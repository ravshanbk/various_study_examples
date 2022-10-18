import 'package:flutter/material.dart';

class AnimatedModalBarierWidget extends StatefulWidget {
  const AnimatedModalBarierWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedModalBarierWidget> createState() =>
      _AnimatedModalBarierWidgetState();
}

class _AnimatedModalBarierWidgetState extends State<AnimatedModalBarierWidget>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  late Widget _animatedModalbarrier;

  late AnimationController _animationController;
  late Animation<Color?> _colorAnimator;
  @override
  void initState() {
    ColorTween colorTween = ColorTween(
      begin: Colors.orangeAccent.withOpacity(.5),
      end: Colors.blueGrey.withOpacity(.5),
    );
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _colorAnimator = colorTween.animate(_animationController);
    _animatedModalbarrier = AnimatedModalBarrier(color: _colorAnimator,dismissible: true,);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100,
              width: 250,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isPressed = true;
                        });
                        _animationController.reset();
                        _animationController.forward();
                        Future.delayed(const Duration(seconds: 3), () {
                          setState(() {
                            _isPressed = false;
                          });
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orangeAccent,
                      ),
                      child: const Text("Press")),
                  if (_isPressed) _animatedModalbarrier
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
