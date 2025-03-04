
import 'package:food_application/feture/presentation/navigation_page.dart';
import 'package:food_application/feture/presentation/screens/details_page_screen/details_screen.dart';
import 'package:food_application/feture/presentation/screens/nav_screeens/home_screen.dart';
import 'package:go_router/go_router.dart';

import '../../feture/presentation/screens/auth_screens/login.dart';
import '../../feture/presentation/screens/auth_screens/signin.dart';
import '../../feture/presentation/screens/auth_screens/splash.dart';

final GoRouter appRoutes = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: 'splash',
    builder: (context, state) => SplashScreen(),
  ),
  //
  GoRoute(
    path: "/login",
    name: "login",
    builder: (context, state) => LoginScreen(),
  ),
  // GoRoute(
  //   path: "/fPassword",
  //   name: "fPassword",
  //   builder: (context, state) => ForgotPasswordScreen(),
  // ),
  GoRoute(
    path: "/signin",
    name: "signin",
  builder: (context, state) => SignInScreen(),
  ),
  // GoRoute(
  //   path: "/bottom",
  //   name: "bottom",
  //   builder: (context, state) => BottomNavScreen(),
  // ),
  GoRoute(
    path: "/nav",
    name: "navPage",
    builder: (context, state) => NavigationPage(),
  ),
  GoRoute(
    path: "/home",
    name: "HomePage",
    builder: (context, state) => HomeScreen(),
  ),
  // GoRoute(
  //   path: "/graph",
  //   name: "graphScreen",
  //   builder: (context, state) => GrapHScreen(),
  // ),
  // GoRoute(
  //   path: "/cWallet",
  //   name: "connectWallet",
  //   builder: (context, state) => ConnectWalletScreen(),
  // ),
  // GoRoute(
  //   path: "/login",
  //   name: "loginPage",
  //   builder: (context, state) => LoginScreen(),
  // ),
  // GoRoute(
  //   path: "/signin",
  //   name: "signinPage",
  //   builder: (context, state) => SigninScreen(),
  // ),
  GoRoute(
    path: "/details",
    name: "dtailsPage",
    builder: (context, state) => DetailsScreen(),
  )
 ]);
