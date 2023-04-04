// ignore_for_file: depend_on_referenced_packages

import 'package:exapmles/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;

class MyObjectbox {
  static late Store store;

  static Future<void> init() async {
    final dir = await path_provider.getApplicationSupportDirectory();
    store = Store(
      getObjectBoxModel(),
      directory: path.join(dir.path, "shop_orders"),
    );
  }
}
