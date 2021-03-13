import 'package:flutter/material.dart';
import 'package:klarmd_test/screens/artists/artists.screen.dart';

class Router {
  static onGenerateRoute(RouteSettings settings) {
  if (settings.name == ArtistsScreen.routeName) {
      ArtistsScreenArgs args = settings.arguments;

      return MaterialPageRoute(
        builder: (_) => ArtistsScreen(
          name: 'Wizkid',
        ),
      );
    } else {
      return MaterialPageRoute(
        builder: (_) => Container(
          child: Text("No route found"),
        ),
      );
    }
  }
}
