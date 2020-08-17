import 'package:flutter/material.dart';
import 'about_us.dart';
import 'content_listing.dart';
import 'content_list_view.dart';
import 'landing_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    print(args);
    switch (settings.name) {
      case '/aboutus':
        return MaterialPageRoute(
          builder: (_) => AboutUsPage(data: args),
        );
      case '/content_listing':
        return MaterialPageRoute(builder: (_) => Content_Listing(data: args));
      case '/content_list_view':
        return MaterialPageRoute(
          builder: (_) => ContentListView(data: args),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: (Text('error')),
        ),
        body: Center(
          child: Text('error'),
        ),
      );
    });
  }
}
