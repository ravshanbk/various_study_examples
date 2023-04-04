import 'package:exapmles/models/my_class.dart';
import 'package:exapmles/other_pages/barcode_scanner/barcode_scanner.dart';
import 'package:exapmles/other_pages/clipper/clipper_example.dart';
import 'package:exapmles/other_pages/freezed/freezed_example.dart';
import 'package:exapmles/other_pages/get_widgets_size/get_widgets_size.dart';
import 'package:exapmles/other_pages/graphql/graphql_page.dart';
import 'package:exapmles/other_pages/mack_book_keyboard/mackbook_wrapper.dart';
import 'package:exapmles/other_pages/objectbox_exapmple/obj_home_page.dart';
import 'package:exapmles/other_pages/objectbox_exapmple/object_box_page.dart';
import 'package:exapmles/other_pages/package_info_pluc_page.dart';
import 'package:exapmles/other_pages/push_pop/first_page.dart';
import 'package:exapmles/other_pages/shell/shell_page.dart';
import 'package:exapmles/other_pages/slider/silider.dart';
import 'package:exapmles/other_pages/socet_io/socet_io.dart';
import 'package:exapmles/other_pages/sticky/sticky_page.dart';
import 'package:exapmles/other_pages/virtual_keyboard/multi_language_keyboard.dart';
import 'package:exapmles/other_pages/virtual_keyboard/virtual_keyboard.dart';
import 'package:exapmles/other_pages/widgets/widgets_home.dart';
import 'package:exapmles/routes/rout_names.dart';
import 'package:exapmles/test/unit_test/provider/news_provider.dart';
import 'package:exapmles/test/unit_test/service/news_service.dart';
import 'package:exapmles/test/unit_test/ui/news_page.dart';
import 'package:exapmles/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.BARCODESCANNER:
        return _route(const BarcodeScannerPage());
      case RouteName.CLIPPER:
        return _route(const ClipperScreen());
      case RouteName.WRAPPER:
        return _route(Wrapper());
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
      case RouteName.FREEZED:
        return _route(
          const FreezedExamplePage(
            myClass: MyClass(
              balance: 123.0,
              id: 007,
              name: "Amir Temur",
            ),
          ),
        );
      case RouteName.PACKAGEINFOPLUS:
        return _route(const PackageInfoPlusPage());
      case RouteName.WIDGETSHOME:
        return _route(const WidgetsHomePage());
      case RouteName.StickyWidgetExample:
        return _route(
          const StickiyExample(
            title: "Sticky Example Title",
          ),
        );
      case RouteName.NEWSPAGE:
        return _route(
          ChangeNotifierProvider(
            create: (create) => NewsChangeNotifier(
              NewsService(),
            ),
            child: const NewsPage(),
          ),
        );
      case RouteName.GRAPHQL:
        return _route(const GraphqlPage());

      case RouteName.VERTUALKEYBOARD:
        return _route(const VirtualKeyboardPage(title: "title"));
      case RouteName.MULTILANGUAGEKEYBOARD:
        return _route(MultiLanguageVirtualKeyboardPage());
      case RouteName.MACKBOOKKEYBOARD:
        return _route(const MacbookKeyboardApp());

      case RouteName.PUSHPOPEXAMPLE:
        return _route(const PushPopExampleFirstPage());
      case RouteName.GetWidgetsSizeExample:
        return _route(GetWidgetsSizeExample());
    }
    return null;
  }

  static MaterialPageRoute _route(Widget page) =>
      MaterialPageRoute(builder: (_) => page);
}
