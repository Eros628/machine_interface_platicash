import 'package:flutter/material.dart';
import 'package:interface_plasticash/screens/depositInterface.dart';
import 'package:interface_plasticash/screens/qr_generator.dart';
import 'package:interface_plasticash/screens/rewardOption.dart';
import 'package:interface_plasticash/screens/startup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interface_plasticash/screens/guideInterface.dart';
import 'screens/thankyou_screen.dart';

void main() {
  runApp(
      ScreenUtilInit(
      designSize: Size(1080, 2400),
      builder: (context, child) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Poppins"))),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',

        onGenerateRoute: (settings){
          switch(settings.name){
            case '/startup':
              return PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 800),
                  reverseTransitionDuration: Duration(milliseconds: 800), // <-- Add this line!
                  pageBuilder: (context, animation, secondaryAnimation) => StartupScreen(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    final curvedAnimation = CurvedAnimation(
                      parent: animation,
                      curve: Curves.linear,
                    );

                    return FadeTransition(
                      opacity: curvedAnimation,
                      child: child,
                    );
                  }
              );
              
            case '/guide':
              return PageRouteBuilder(transitionDuration: Duration(milliseconds: 800),
                  reverseTransitionDuration: Duration(milliseconds: 800), // <-- Add this line!
                  pageBuilder: (context, animation, secondaryAnimation) => GuideScreen(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    final curvedAnimation = CurvedAnimation(
                      parent: animation,
                      curve: Curves.linear,
                    );

                    return FadeTransition(
                      opacity: curvedAnimation,
                      child: child,
                    );
                  });
            case '/deposit':
              return PageRouteBuilder(transitionDuration: Duration(milliseconds: 800),
                  reverseTransitionDuration: Duration(milliseconds: 800), // <-- Add this line!
                  pageBuilder: (context, animation, secondaryAnimation) => DepositIntro(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    final curvedAnimation = CurvedAnimation(
                      parent: animation,
                      curve: Curves.linear,
                    );

                    return FadeTransition(
                      opacity: curvedAnimation,
                      child: child,
                    );
                  });
            case '/deposit_main':
              return PageRouteBuilder(transitionDuration: Duration(milliseconds: 800),
                  reverseTransitionDuration: Duration(milliseconds: 800), // <-- Add this line!
                  pageBuilder: (context, animation, secondaryAnimation) => DepositMain(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    final curvedAnimation = CurvedAnimation(
                      parent: animation,
                      curve: Curves.linear,
                    );

                    return FadeTransition(
                      opacity: curvedAnimation,
                      child: child,
                    );
                  });
            case '/payout':
              final count = settings.arguments as int;
              return PageRouteBuilder(transitionDuration: Duration(milliseconds: 800),
                  reverseTransitionDuration: Duration(milliseconds: 800), // <-- Add this line!
                  pageBuilder: (context, animation, secondaryAnimation) => PayoutScreen(count: count),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    final curvedAnimation = CurvedAnimation(
                      parent: animation,
                      curve: Curves.linear,
                    );

                    return FadeTransition(
                      opacity: curvedAnimation,
                      child: child,
                    );
                  });
            case '/reward_option':
              return PageRouteBuilder(transitionDuration: Duration(milliseconds: 800),
                  reverseTransitionDuration: Duration(milliseconds: 800), // <-- Add this line!
                  pageBuilder: (context, animation, secondaryAnimation) => RewardOptions(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    final curvedAnimation = CurvedAnimation(
                      parent: animation,
                      curve: Curves.linear,
                    );

                    return FadeTransition(
                      opacity: curvedAnimation,
                      child: child,
                    );
                  });
            case '/message':
              final payout = settings.arguments as int;
              return PageRouteBuilder(transitionDuration: Duration(milliseconds: 800),
                  reverseTransitionDuration: Duration(milliseconds: 800), // <-- Add this line!
                  pageBuilder: (context, animation, secondaryAnimation) => MessageConfirm(payout: payout),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    final curvedAnimation = CurvedAnimation(
                      parent: animation,
                      curve: Curves.linear,
                    );

                    return FadeTransition(
                      opacity: curvedAnimation,
                      child: child,
                    );
                  });
            case '/qr_code':
              return PageRouteBuilder(transitionDuration: Duration(milliseconds: 800),
                  reverseTransitionDuration: Duration(milliseconds: 800), // <-- Add this line!
                  pageBuilder: (context, animation, secondaryAnimation) => QrCodeGen(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    final curvedAnimation = CurvedAnimation(
                      parent: animation,
                      curve: Curves.linear,
                    );

                    return FadeTransition(
                      opacity: curvedAnimation,
                      child: child,
                    );
                  });
            default:
              return MaterialPageRoute(builder: (_) => StartupScreen());
          }
        },
        );
  }
}