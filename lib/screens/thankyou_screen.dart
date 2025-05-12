import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interface_plasticash/screens/startup.dart';


class MessageConfirm extends StatefulWidget {
  final int count;
  final int? payout;
  const MessageConfirm({super.key, required this.payout, required this.count, });

  @override
  State<MessageConfirm> createState() => _MessageConfirmState();
}

class _MessageConfirmState extends State<MessageConfirm> {

  @override
  void initState(){
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
    Timer(Duration(seconds: 4), () {
      Navigator.popUntil(context, (route) => route.isFirst);
    });
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
           Align(
                alignment: Alignment.centerRight,
                child: Hero(
                  tag: "circle2",
                  child: Container(decoration: BoxDecoration(color:  Color.fromARGB(255, 27, 75, 61) ),)),
              ),

          // Content
          Padding(
              padding:EdgeInsets.fromLTRB(0,100.w,0, 0),
              child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                
                Container(padding: EdgeInsets.fromLTRB(150.w,0,0,120.w) ,
                  child: Hero( tag:"logo",child: Image(image: AssetImage('assets/logo.png'),height: 400.w,)),
                ),
               
                Padding(
                  padding: EdgeInsets.only(right: 50, top: 45),
                  child: Column(children: [
                      Text("THANK YOU!", style: TextStyle(fontSize: 40.sp, color: Colors.white)),
                  SizedBox(height: 70.h),
                  Text(widget.payout == 1 ? "You have earned ${widget.count * 0.25} coins.\nYour rewards have been dispensed." : "You have Earned ${widget.count * 1} Points.\nRewards Have Been Added To Your Account",
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 25.sp, color: Colors.white), textAlign: TextAlign.center,),
                  SizedBox(height: 100.h,)
                  ,
                  Text("Keep Up The Great Work!", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 25.sp, color: Colors.white) )
                  ],),
                ),
              ])
          ),
        ],
      ),
    );
  }
}
