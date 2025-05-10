import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interface_plasticash/screens/startup.dart';


class MessageConfirm extends StatefulWidget {
  final int payout;
  const MessageConfirm({super.key, required this.payout});

  @override
  State<MessageConfirm> createState() => _MessageConfirmState();
}

class _MessageConfirmState extends State<MessageConfirm> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 4),(){
      Navigator.popUntil(context, (route) => route.isFirst);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(height: 250.h,width: 280.w,decoration: BoxDecoration(color: Color.fromARGB(255, 27, 75, 61), borderRadius:BorderRadius.only(bottomRight: Radius.circular(200)) ),),
          ),
          // Curved green background at the bottom
          Align(
              alignment: Alignment.bottomCenter,
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 50,0),
                  child: Hero(tag: "bottomup1",child: Row(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.spaceBetween,children:[Image(image:AssetImage('assets/leaf2.png')), Image(image:AssetImage('assets/leaf1.png'))])),
                ),
                Hero(
                  tag: "bottomup",
                  child: ClipPath(
                    clipper: BottomCurveClipper(),
                    child: Container(
                      color: Color.fromARGB(255, 27, 75, 61), // Your green color
                      height: 1600.h,
                    ),
                  ),
                )
              ])
          ),

          // Content
          Padding(
              padding:EdgeInsets.fromLTRB(50,200.h,50, 0),
              child: Column(  children: [
                Container(padding: EdgeInsets.fromLTRB(40, 0.h,50,10.h) ,
                  child: Hero( tag:"logo",child: Image(image: AssetImage('assets/logo.png'),height: 600.h,)),
                ),
                SizedBox(height: 450.h),
                Text("THANK YOU!", style: TextStyle(fontSize: 90.sp, color: Colors.white)),
                SizedBox(height: 70.h),
                Text(widget.payout == 1 ? "You have earned 5 coins.\nYour rewards have been dispensed." : "You have Earned 5 Coins.\nRewards Have Been Added To Your Account",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 40.sp, color: Colors.white), textAlign: TextAlign.center,),
                SizedBox(height: 100.h,)
                ,
                Text("Keep Up The Great Work!", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 50.sp, color: Colors.white) )


              ])
          ),
        ],
      ),
    );
  }
}
