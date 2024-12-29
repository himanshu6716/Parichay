import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parichay/utils/routes/routes_name.dart';
import 'package:parichay/view/auth/signin_view.dart';
import 'package:parichay/view/auth/signup_view.dart';
import 'package:parichay/view/home_view/home_view.dart';
import 'package:parichay/view/set_pref_view/set_preference_view.dart';

import '../../view/on_boarding/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (BuildContext context) => SplashView(),
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => HomeView(),
        );
      case RoutesName.signup:
        return MaterialPageRoute(
          builder: (BuildContext context) => SignUpView(),
        );
      case RoutesName.signin:
        return MaterialPageRoute(
          builder: (BuildContext context) => SignInView(),
        );
      case RoutesName.profilesetup:
        return MaterialPageRoute(
          builder: (BuildContext context) => ProfileSetupView(),
        );
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined...!!'),
            ),
          );
        });
    }
  }
}
