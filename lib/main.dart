import 'package:flutter/material.dart';
import 'package:interface_plasticash/firebase_options.dart';
import 'package:interface_plasticash/screens/depositInterface.dart';
import 'package:interface_plasticash/screens/qr_generator.dart';
import 'package:interface_plasticash/screens/rewardOption.dart';
import 'package:interface_plasticash/screens/startup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interface_plasticash/screens/guideInterface.dart';
import 'screens/thankyou_screen.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  
  runApp(
      ScreenUtilInit(
      designSize: Size(1080, 2400),
      builder: (context, child) => MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

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
            final count = settings.arguments as int;
            return PageRouteBuilder(transitionDuration: Duration(milliseconds: 800),
                reverseTransitionDuration: Duration(milliseconds: 800), // <-- Add this line!
                pageBuilder: (context, animation, secondaryAnimation) => RewardOptions(count:count),
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
            final payout = settings.arguments as int?;
            final count = settings.arguments as int;
            return PageRouteBuilder(transitionDuration: Duration(milliseconds: 800),
                reverseTransitionDuration: Duration(milliseconds: 800), // <-- Add this line!
                pageBuilder: (context, animation, secondaryAnimation) => MessageConfirm(payout: payout, count: count,),
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
            final count = settings.arguments as int;
            return PageRouteBuilder(transitionDuration: Duration(milliseconds: 800),
                reverseTransitionDuration: Duration(milliseconds: 800), // <-- Add this line!
                pageBuilder: (context, animation, secondaryAnimation) => QrCodeGen(count: count),
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
}}