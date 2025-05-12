import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:crypto/crypto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService{

  final CollectionReference<Map<String, dynamic>> firestore = 
  FirebaseFirestore.instance.collection('qrCode');



  Future<void> uploadQrCode (String json, String timeStart, int minutes, String id)async {
    
    DateTime start = DateTime.parse(timeStart);

    DateTime end = start.add(Duration(minutes: minutes));

    // Format to ISO string if needed
    String timeEnd = end.toIso8601String();
    String parsedDate = DateTime.parse(timeEnd).toString();

    await firestore.doc(id).set({
      "data": json,
      "status": "NotRecieved",
      "timeStarted": timeStart,
      "timeEnd":parsedDate
    });
  }

  Future<void> updateStatus(String id) async{
    await firestore.doc(id).set({
      'status': 'Invalid'
    },SetOptions(merge: true));
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> qrStatusStream(String docId) {
    return firestore.doc(docId).snapshots();
  }


}




class QrCodeGen extends StatefulWidget {
  final int count;

  const QrCodeGen({super.key, required this.count});

  @override
  State<QrCodeGen> createState() => _QrCodeGenState();
}

class _QrCodeGenState extends State<QrCodeGen> {
  final int bottles = 10;
  final String machine = 'M001';
  int points = 50;
  int _secondsLeft = 500;
  late Timer _timer;
  late String qrData;
  String date=  DateTime.now().toString();

  @override
  void initState(){
    super.initState();
    _startCountdown();
     qrData = generatedQR(bottles, points, date, machine, "PlastiCash-2025-OLJD");
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


  String generatedQR(int bottles, int points, String date, String machine, String  key ){
    final dataMap = {
      "bottles" : bottles,
      "points": points,
      "date": date,
      "machine": machine
    };

    final dataString = jsonEncode(dataMap);

    final hmac = Hmac(sha256, utf8.encode(key));
    final digest = hmac.convert(utf8.encode(dataString));

    final qrData = {
      "data": dataMap,
      "signature":digest.toString()
    };

    DatabaseService().uploadQrCode(jsonEncode(qrData),date,_secondsLeft, jsonEncode(qrData));

    return jsonEncode(qrData);

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
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: DatabaseService().qrStatusStream(qrData),
      builder: (context, snapshot) {

          if(snapshot.connectionState == ConnectionState.active){
            CircularProgressIndicator();
          }

          

           if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }


          if(!snapshot.hasData || snapshot.data!.data()!.isEmpty){
            return CircularProgressIndicator();
          }
          
          final data = snapshot.data!.data()!;
          final qrStatus = data['status'];

          if(qrStatus == 'Recieved'){
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushNamed(context,'/startup');
           });
          }



        return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
            children: [
            Padding(
              padding:  EdgeInsets.fromLTRB(40.h,0.w,40.h,0.w),
              child: Row(
                spacing: 90.h,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 170.w),
                    child: Column(
                      spacing: 50.h,
                      children: [
                        Text("SCAN THE QR CODE USING THE APP \nTO RECEIVE YOUR REWARDS", style: TextStyle(fontWeight: FontWeight.bold,color:  Color.fromARGB(255, 27, 75, 61), fontSize: 30.sp), textAlign: TextAlign.center,),
                        Text("Time Left Before the QR Code Expired", style: TextStyle(color: Color.fromARGB(255, 27, 75, 61), fontWeight: FontWeight.normal, fontSize: 20.sp),)
                      , Text(_formattedTime, style: TextStyle(color: Color.fromARGB(255, 27, 75, 61), fontSize: 30.sp))
                      ],
                    ),
                  ),
                  
                  Container(
                    height: 420.w,
                    decoration: BoxDecoration(color: Color.fromARGB(255, 27, 75, 61),borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: QrImageView(
                          data: qrData,
                          version: QrVersions.auto,
                          size: 350.w,
                          backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll( Color.fromARGB(255, 27, 75, 61)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15))))
                  ),
                  onPressed: (){

                    showDialog(context: context, 
                    builder: (BuildContext context){
                      return AlertDialog(
                        backgroundColor: Color.fromARGB(255, 27, 75, 61),
                        contentPadding: EdgeInsets.all(20),
                        title: Center(child: Text("Are you sure you want to cancel?", style: TextStyle(color: Colors.white),)),
                        content: Container(
                          constraints: BoxConstraints(
                            maxHeight: 190.h
                          ),
                          
                          child: Center(child: Text("Canceling now means you’ll lose your reward.", style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 20.sp),))),
                        actions: [
                          TextButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  }, 
                                  child: Text("Back", style: TextStyle(color: Colors.white),)),
                          TextButton(
                            onPressed: () async{
                              await DatabaseService().updateStatus(snapshot.data!.id);
                              Navigator.popUntil(context, (route) => route.isFirst);
                            }, 
                            child: Text("Proceed", style: TextStyle(color: Colors.white),))
                        ],
                      );
                    }
                    );
                  }, 
                  child: Text("Cancel", style: TextStyle(color: Colors.white, fontSize: 25.sp),)),
              ),
            )
            
            
            ])
        );
      }
    );
  }
}

