import 'dart:async';
import 'package:flutter/material.dart';
import 'package:interface_plasticash/screens/startup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';


class QrCodeGen extends StatefulWidget {

  const QrCodeGen({super.key});

  @override
  State<QrCodeGen> createState() => _QrCodeGenState();
}

class _QrCodeGenState extends State<QrCodeGen> {
  final int count = 10;
  final String machine = 'M001';
  final double earnedRewards = 50;
  int _secondsLeft = 500;
  late Timer _timer;

  @override
  void initState(){
    super.initState();
    _startCountdown();
  }

  void _startCountdown(){
    _timer = Timer.periodic(Duration(seconds: 1), (timer){
      if(_secondsLeft == 0){
        _timer.cancel();
        _showExpiryDialog();
      }
      else{
        setState(() {
          _secondsLeft--;
        });
      }
    });
  }
  @override
  void dispose(){
    _timer.cancel();
    super.dispose();
  }

  void _showExpiryDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:Color.fromARGB(255, 27, 75, 61) ,
          title: Text('QR Code Expired', style: TextStyle(color: Colors.white),),
          content: Text('The QR Code has expired. Please try again later.', style: TextStyle(color: Colors.white)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pushReplacementNamed('/startup'); // Navigate to the startup screen
              },
              child: Text('Home', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  String get _formattedTime{
    int min = _secondsLeft ~/ 60;
    int secs = _secondsLeft % 60;
    return "$min:${secs.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    String data = "Count: $count, Machine: $machine, Rewards: $earnedRewards";
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
        children: [
        Align(
        alignment: Alignment.topLeft,
        child: Container(height: 250.h,width: 280.w,decoration: BoxDecoration(color: Color.fromARGB(255, 27, 75, 61), borderRadius:BorderRadius.only(bottomRight: Radius.circular(200)) )
        )
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40,120,40,0),
          child: Column(
            spacing: 40.h,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text("SCAN THE QR CODE USING THE APP TO RECEIVE YOUR REWARDS", style: TextStyle(fontWeight: FontWeight.bold,color:  Color.fromARGB(255, 27, 75, 61), fontSize: 50.sp), textAlign: TextAlign.center,),
              Container(
                height: 900.h,
                decoration: BoxDecoration(color: Color.fromARGB(255, 27, 75, 61),borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: QrImageView(
                      data: data,
                      version: QrVersions.auto,
                      size: 700.h,
                      backgroundColor: Colors.white,
                  ),
                ),
              ),
              Text("Time Left Before the QR Code Expired", style: TextStyle(color: Color.fromARGB(255, 27, 75, 61), fontWeight: FontWeight.normal, fontSize: 35.sp),)
              ,Text(_formattedTime, style: TextStyle(color: Color.fromARGB(255, 27, 75, 61), fontSize: 60.sp))

            ],
          ),
        )
        ])
    );
  }
}

