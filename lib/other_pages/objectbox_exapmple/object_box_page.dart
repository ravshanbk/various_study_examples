import 'dart:async';

import 'package:exapmles/objectbox.g.dart';
import 'package:exapmles/other_pages/objectbox_exapmple/box/my_object_box.dart';
import 'package:exapmles/other_pages/objectbox_exapmple/models/shop_order.dart';
import 'package:exapmles/routes/rout_names.dart';
import 'package:exapmles/services/navigator_service.dart';
import 'package:flutter/material.dart';

class ObjectBoxExample extends StatefulWidget {
  const ObjectBoxExample({Key? key}) : super(key: key);

  @override
  State<ObjectBoxExample> createState() => _ObjectBoxExampleState();
}

class _ObjectBoxExampleState extends State<ObjectBoxExample> {
  late StreamSubscription subscription;
  late Stream<Query<ShopOrder>> stream;
  int idf = 0;
  @override
  void initState() {
    stream = MyObjectbox.store.box<ShopOrder>().query().watch();
    subscription = stream.listen((event) async {
      List<ShopOrder> v = event.find().reversed.toList();
      _dataChanged(v);
    });
    super.initState();
  }

  _dataChanged(List<ShopOrder> v) {
    idf++;
    print("========== Box trigered ${v.length} IDF: $idf =============");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: const Text("Go To The Next Page"),
        onPressed: () {
          NavigatorService.pushNamedAndRemoveUntil(RouteName.OBJECTBOX_NEXT);
        },
      )),
    );
  }
}
