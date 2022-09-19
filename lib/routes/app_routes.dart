import 'package:exapmles/other_pages/barcode_scanner/barcode_scanner.dart';
import 'package:exapmles/other_pages/clipper/clipper_example.dart';
import 'package:exapmles/other_pages/objectbox_exapmple/obj_home_page.dart';
import 'package:exapmles/other_pages/objectbox_exapmple/object_box_page.dart';
import 'package:exapmles/other_pages/shell/shell_page.dart';
import 'package:exapmles/other_pages/slider/silider.dart';
import 'package:exapmles/other_pages/socet_io/socet_io.dart';
import 'package:exapmles/routes/rout_names.dart';
import 'package:exapmles/wrapper.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.BARCODESCANNER:
        return _route(const BarcodeScannerPage());
      case RouteName.CLIPPER:
        return _route(ClipperScreen());
      case RouteName.WRAPPER:
        return _route(const Wrapper());
      case RouteName.OBJECTBOX:
        return _route(const ObjectBoxExample());
      case RouteName.SHELL:
        return _route(const ShellPage());
      case RouteName.SLIDER:
        return _route(const SliderExample());
      case RouteName.SOCKET_IO:
        return _route(const SocketIoExamplePagee());
      case RouteName.OBJECTBOX_NEXT:
        return _route(const ObjectBoxNextPage());
    }
    return null;
  }

  static MaterialPageRoute _route(Widget page) =>
      MaterialPageRoute(builder: (_) => page);
}
