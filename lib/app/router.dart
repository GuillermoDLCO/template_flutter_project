import 'package:auto_route/auto_route_annotations.dart';
import 'package:walletonbankingapp/ui/views/login/login_view.dart';
import 'package:walletonbankingapp/ui/views/welcome/welcome_view.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  WelcomeView welcomeViewRoute;
  LoginView loginViewRoute;
}
