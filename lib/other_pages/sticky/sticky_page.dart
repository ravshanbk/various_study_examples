import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class StickiyExample extends StatefulWidget {
  const StickiyExample({required this.title, Key? key}) : super(key: key);
  final String title;

  @override
  _StickiyExampleState createState() => _StickiyExampleState();
}

class _StickiyExampleState extends State<StickiyExample> {
  final controller = ScrollController();
  late OverlayEntry sticky;
  GlobalKey stickyKey = GlobalKey();

  @override
  void initState() {
    // if (sticky != null) {
    //   sticky.remove();
    // }
    sticky = OverlayEntry(
      builder: (context) => stickyBuilder(context),
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      Overlay.of(context).insert(sticky);
    });

    super.initState();
  }

  @override
  void dispose() {
    sticky.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView.builder(
          controller: controller,
          itemBuilder: (context, index) {
            if (index == 6) {
              return Container(
                key: stickyKey,
                height: 100.0,
                color: Colors.green,
                child: const Text("I'm fat"),
              );
            }
            return ListTile(
              title: Text(
                'Hello $index',
                style: const TextStyle(color: Colors.teal),
              ),
            );
          },
        ),
      );

  Widget stickyBuilder(BuildContext context) => AnimatedBuilder(
        animation: controller,
        builder: (_, Widget? child) {
          final keyContext = stickyKey.currentContext;
          if (keyContext != null) {
            // widget is visible
            final box = keyContext.findRenderObject() as RenderBox;
            final pos = box.localToGlobal(Offset.zero);
            return Positioned(
              top: pos.dy + box.size.height,
              left: 50.0,
              right: 50.0,
              height: box.size.height,
              child: Material(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.purple,
                  child: const Text("^ Nah I think you're okay"),
                ),
              ),
            );
          }
          return Container();
        },
      );
}
