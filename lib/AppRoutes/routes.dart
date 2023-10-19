import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:kolachibook/View/Auth/signup.dart';

class AppRoutes {
  static const String splash = "/splash";
  static const String signupp = "/signup";

  static List<GetPage> appRoutes = [
    GetPage(name: signupp, page: () => const Signup())
  ];
}
