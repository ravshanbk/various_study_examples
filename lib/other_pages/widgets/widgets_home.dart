import 'package:exapmles/other_pages/widgets/animated_icon_widget.dart';
import 'package:exapmles/other_pages/widgets/call_back_short_cuts_page.dart';
import 'package:exapmles/other_pages/widgets/clip_oval_ex.dart';
import 'package:exapmles/other_pages/widgets/editable_text_widget.dart';
import 'package:exapmles/other_pages/widgets/size_transition.dart';
import 'package:exapmles/other_pages/widgets/animaated_modal_barrier.dart';
import 'package:flutter/material.dart';

class WidgetsHomePage extends StatefulWidget {
  const WidgetsHomePage({Key? key}) : super(key: key);

  @override
  State<WidgetsHomePage> createState() => _WidgetsHomePageState();
}

class _WidgetsHomePageState extends State<WidgetsHomePage> {
  late List<Widget> widgets;
  @override
  void initState() {
    widgets = const [
      AnimatedIconWidget(),
      AnimatedListWidget(),
      AnimatedModalBarierWidget(),
      ClipOvalExample(),
      EditibleTextWidgetPage(),
      CallBackShortCutsPage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(
          icon:const  Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),),
      body: ListView.separated(
          padding: const EdgeInsets.all(20),
          itemBuilder: (_, __) {
            return ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => widgets[__]));
                },
                child: Text(widgets[__].toString()));
          },
          separatorBuilder: ((context, index) => const SizedBox(
                height: 20,
              )),
          itemCount: widgets.length),
    );
  }
}
