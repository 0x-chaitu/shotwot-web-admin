
import 'package:admin/src/routes/utils.dart';
import 'package:admin/src/screens/login.dart';
import 'package:go_router/go_router.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
      // refreshListenable: AppService.instance,
      debugLogDiagnostics: true,
      // navigatorKey: AppService.instance.navigatorKey,
      // redirect: _redirect,
      routes: [
        GoRoute(
          path: PAGES.home.screenPath,
          name: PAGES.home.screenName,
          builder: (context, state) => const LoginScreen(),
        ),
      ]);
}

// String? _redirect(BuildContext context, GoRouterState state) {
//   final bool isLoggedIn = AppService.instance.isLoggedIn;
//   if (isLoggedIn) {
//     return state.fullPath;
//   } else if (state.fullPath == PAGES.login.screenPath) {
//     return state.fullPath;
//   } else {
//     final token = objectBox.getToken();
//     if (token != null) {
//       return state.fullPath;
//     }
//   }
//   return PAGES.signup.screenPath;
// }