import 'package:exapmles/helpers/colored_console_print.dart';
import 'package:flutter/material.dart';
import 'package:measured_size/measured_size.dart';

class GetWidgetsSizeExample extends StatefulWidget {
  const GetWidgetsSizeExample({super.key});

  @override
  State<GetWidgetsSizeExample> createState() => _GetWidgetsSizeExampleState();
}

class _GetWidgetsSizeExampleState extends State<GetWidgetsSizeExample> {
  Size wsize = Size.zero;
  String v = '';

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Height/Width of Widget"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () {
                  printf("text ko'paytirish bosildi");
                  v +=
                      'faiwusdfhapwefgawe;jklfh;akwjef;ajweh;fkajwehf;kajwefh;akwlefhawkejfhakwejfakwlefhawkejfhakwejfakwlefhawkejfhakwejfakwlefhawkejfhakwejfakwlefhawkejfhakwejfakwlefhawkejfhakwejfakwlefhawkejfhakwejfakwlefhawkejfhakwejfakwlefhawkejfhakwejfakwlefhawkejfhakwejfakwlefhawkejfhakwejfakwlefhawkejfhakwejfakwlefhawkejfhakwejf';
                  setState(() {});
                },
                child: Text(
                  "Screen Height: $screenheight , Screen Width: $screenwidth",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(15),
                child: MeasuredSize(
                  onChange: (Size size) {
                    setState(() {
                      printf(
                          '::::::::::  the size ${size.width} / ${size.height}  ::::::::::');
                      wsize = size;
                    });
                  },
                  child: Card(
                      child: Container(
                          child: Text("$v Width and Height:" +
                              wsize.width.toString() +
                              "," +
                              wsize.height.toString()))),
                )),
            Padding(
              padding: const EdgeInsets.all(15),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  print("Height:" + constraints.maxHeight.toString());
                  print("Height:" + constraints.minHeight.toString());
                  print("Width:" + constraints.maxWidth.toString());
                  print("Width:" + constraints.minWidth.toString());
                  return Text(" $v fasfsd");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
