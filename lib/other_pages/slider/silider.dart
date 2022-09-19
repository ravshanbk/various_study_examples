import 'package:exapmles/other_pages/slider/multi_slider.dart';
import 'package:flutter/material.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({Key? key}) : super(key: key);

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double value = 0.400;
  double end = 0.800;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MultiSliderPage(
              onSliderUpdate: (v, vv, vvv) {
                print("$v / $vv / $vvv");
              },
              colorX: Colors.amber,
              colorY: Colors.green,
              colorZ: Colors.red,
              key: Key("multi slidible"),
              max: 100,
              min: 0,
              size: Size(30, 50)),
          RangeSlider(
              values: RangeValues(value, end),
              onChanged: (v) {
                value = v.start;
                end = end;
                setState(() {});
                print("RANGEsLEDER ${v.end} /  ${v.start}");
              })
        ],
      ),
    );
  }
}
