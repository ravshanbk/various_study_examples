import 'dart:math';

import 'package:flutter/material.dart';

class MultiSliderPage extends StatefulWidget {
  const MultiSliderPage({
    Key? key,
    required this.onSliderUpdate,
    this.size = const Size(5, 10),
    this.min = 0,
    this.max = 1.0,
    this.colorX = Colors.green,
    this.colorY = Colors.blue,
    this.colorZ = Colors.redAccent,
  }) : super(key: key);

  final Function(double? x, double? y, double? z) onSliderUpdate;

  ///size of moveable 3x point 😅, forgot the name maybe thumbs
  final Size size;
  final double? min;
  final double? max;

  final Color colorX;
  final Color colorY;
  final Color colorZ;

  @override
  State<MultiSliderPage> createState() => _MultiSliderPageState();
}

class _MultiSliderPageState extends State<MultiSliderPage> {
  /// three slider position
  double? x;
  double? y;
  double? z;

  final double tapSpacesArea = .05;

  // currect active slider , help to prevent overlLAp while sliding
  int activeSliderNumber = 0;

  //* Update sldier
  void _updateSlider(double dx, double maxWidth) {
    final tapPosition = dx;

    //* update logic
    if (tapPosition <= 0 || tapPosition >= maxWidth) {
      return;
    }

    //* update on UI based on slider number
    if (activeSliderNumber == 0) {
      setState(() {
        x = tapPosition;
      });
    } else if (activeSliderNumber == 1) {
      setState(() {
        y = tapPosition;
      });
    } else if (activeSliderNumber == 2) {
      setState(() {
        z = tapPosition;
      });
    }

    //pass value on main widget
    widget.onSliderUpdate(
      dp(_generateSliderValue(maxWidth: maxWidth, x: x!)),
      dp(_generateSliderValue(maxWidth: maxWidth, x: y!)),
      dp(_generateSliderValue(maxWidth: maxWidth, x: z!)),
    );
  }

  //round number
  double dp(double val, {int places = 2}) {
    num mod = pow(10.0, places);
    return ((val * mod).round().toDouble() / mod);
  }

  //* calculate slider value
  double _generateSliderValue({
    required double maxWidth,
    required double x,
  }) {
    // x is slider original position on width:maxWidth

    return (widget.max! - widget.min!) * (x / maxWidth) + widget.min!;
  }

  //* select ActiveSlider, fixed overLap issue
  //* slider Selector logic
  void _selectSlider({
    required double maxWidth,
    required double tapPosition,
  }) {
    final maxArea = maxWidth * tapSpacesArea;

    if ((tapPosition - x!).abs() < maxArea) {
      setState(() {
        activeSliderNumber = 0;
      });
    } else if ((tapPosition - y!).abs() < maxArea) {
      setState(() {
        activeSliderNumber = 1;
      });
    } else if ((tapPosition - z!).abs() < maxArea) {
      setState(() {
        activeSliderNumber = 2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 50,
            child: LayoutBuilder(builder: (context, constraints) {
              final maxWidth = constraints.maxWidth - 10;
              x = x ?? 0;
              y = y ?? constraints.maxWidth / 2;
              z = z ?? maxWidth;
              return Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: x,
                    child: Container(
                      height: activeSliderNumber == 0
                          ? widget.size.height * 1.5
                          : widget.size.height,
                      width: widget.size.width,
                      color: widget.colorX,
                    ),
                  ),
                  //* paint Y
                  Positioned(
                    left: y,
                    child: Container(
                      height: activeSliderNumber == 1
                          ? widget.size.height * 1.5
                          : widget.size.height,
                      width: widget.size.width,
                      color: widget.colorY,
                    ),
                  ),
                  //* paint z
                  Positioned(
                    left: z,
                    child: Container(
                      height: activeSliderNumber == 2
                          ? widget.size.height * 1.5
                          : widget.size.height,
                      width: widget.size.width,
                      color: widget.colorZ,
                    ),
                  ),

                  const Divider(
                    endIndent: 10,
                  ),

                  GestureDetector(
                    onTapDown: (details) => _selectSlider(
                        maxWidth: maxWidth,
                        tapPosition: details.localPosition.dx),
                    onPanUpdate: (details) =>
                        _updateSlider(details.localPosition.dx, maxWidth),
                  ),
                ],
              );
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.min.toString(),
              ),
              Text(
                widget.max.toString(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
