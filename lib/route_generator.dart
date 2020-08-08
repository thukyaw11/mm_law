import 'package:flutter/material.dart';
import 'package:omi_first_app/main.dart';
import 'about_us.dart';
import 'content_listing.dart';
import 'content_list_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LandingPage());
      case '/aboutus':
        return MaterialPageRoute(
          builder: (_) => AboutUsPage(),
        );
      case '/content_listing':
        return MaterialPageRoute(builder: (_) => Content_Listing());
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
