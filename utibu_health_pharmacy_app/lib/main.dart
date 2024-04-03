import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utibu_health_pharmacy_app/models/auth_model.dart';
import 'package:utibu_health_pharmacy_app/screens/auth_page.dart';
import 'package:utibu_health_pharmacy_app/screens/inventory_details.dart';
import 'package:utibu_health_pharmacy_app/screens/order_page.dart';
import 'package:utibu_health_pharmacy_app/screens/success_order.dart';
import 'package:utibu_health_pharmacy_app/utils/config.dart';
import 'package:utibu_health_pharmacy_app/utils/main_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  static final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
  return ChangeNotifierProvider<AuthModel>(
      create: (context) => AuthModel(),
      child: MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Utibu Health Pharmacy',
          theme: ThemeData(
            // This is the theme of your application.
      
            inputDecorationTheme: const InputDecorationTheme(
              focusColor: Config.primaryColor,
              border: Config.outlinedBorder,
              focusedBorder: Config.focusBorder,
              errorBorder: Config.errorBorder,
              enabledBorder: Config.outlinedBorder,
              floatingLabelStyle: TextStyle(color: Config.primaryColor),
              prefixIconColor: Colors.black38,
            ),
            scaffoldBackgroundColor: Colors.white,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Config.primaryColor,
              selectedItemColor: Colors.white,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              unselectedItemColor: Colors.grey.shade700,
              elevation: 10,
              type: BottomNavigationBarType.fixed,
            ),
          ),
          initialRoute: '/',
          routes: {
            //auth page
            '/': (context) => const AuthPage(),
            //upon signing in
            'main': (context) => const MainLayout(),
            'order_page': (context) => const OrderPage(),
            'inv_details': (context) => const Inventorydetails(),
            'success_order': (context) => const OrderOkay(),
            
            
          },
        ),
    );
  }
}
