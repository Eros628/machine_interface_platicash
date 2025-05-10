import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interface_plasticash/screens/startup.dart';



class DepositIntro extends StatefulWidget{
  const DepositIntro({super.key});

  @override
  State<DepositIntro> createState() => _DepositIntroState();
}

class _DepositIntroState extends State<DepositIntro> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        setState(() {
          isOpen = true;
        });
        Future.delayed(Duration(seconds: 5), (){
          if(!mounted){ return;}
          Navigator.pushNamed(context, '/deposit_main');

        });
      },
      child: Scaffold(
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
            SingleChildScrollView(
                child: Padding(
                    padding:EdgeInsets.fromLTRB(50,200.h,50, 0),
                    child: Column( mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                      Column(children: [Container(padding: EdgeInsets.fromLTRB(40, 0.h,50,10.h) ,
                        child: Hero( tag:"logo",child: Image(image: AssetImage('assets/logo.png'),height: 600.h,)),
                      )]),
                      SizedBox(height: 750.h),
                      BlinkingText(isOpen == true ? "OPENING" : "START DEPOSIT", fontSize: 70.sp, color: Colors.white),
                    ])
                )
            ),
          ],
        ),
      ),
    );
  }
}



class DepositMain extends StatefulWidget {

  const DepositMain({super.key});

  @override
  State<DepositMain> createState() => _DepositMainState();
}

class _DepositMainState extends State<DepositMain> {
  int count = 0;
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
          SingleChildScrollView(
              child: Padding(
                  padding:EdgeInsets.fromLTRB(0,200.h,0, 0),
                  child: Column( mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    Column(children: [Container(padding: EdgeInsets.fromLTRB(40, 0.h,50,10.h) ,
                      child: Hero( tag:"logo",child: Image(image: AssetImage('assets/logo.png'),height: 600.h,)),
                    )]),
                    SizedBox(height: 320.h),
                    Text("$count", style: TextStyle(fontSize: 100.sp, color: Colors.white),),
                    Text("Plastic Bottle Collected", style: TextStyle(fontSize: 63.sp, color: Colors.white)),
                    SizedBox(height: 370.h),
                    BlinkingText("READY TO DEPOSIT",fontSize: 63.sp, color: Colors.white),
                    SizedBox(height: 30.h,),
                    Text("Place the bottle one at a time\n into the deposit slot", style: TextStyle(fontSize: 40.sp, color: Colors.white, fontWeight: FontWeight.normal), textAlign: TextAlign.center,),
                    SizedBox(height: 180.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            style: ButtonStyle(
                                backgroundColor:WidgetStatePropertyAll(Colors.white),
                                fixedSize: WidgetStatePropertyAll(Size(350.h, 50.w)),
                                shape:WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12))
                                    )
                                )
                            ),
                            onPressed: (){
                            },
                            child: Text("Cancel", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50.sp, color: Color.fromARGB(255, 27, 75, 61)),)),
                        TextButton(
                            style: ButtonStyle(
                              backgroundColor:WidgetStatePropertyAll(Colors.white),
                              fixedSize: WidgetStatePropertyAll(Size(350.h, 50.w)),
                              shape:WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)))
                              )
                            ),

                            onPressed:(){
                                Navigator.pushNamed(context, '/payout', arguments: count);
                            },
                            child: Text("Payout", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50.sp, color: Color.fromARGB(255, 27, 75, 61))))
                      ],
                    ),
                  ])
              )
          ),
        ],
      ),
    );
  }
}

class PayoutScreen extends StatefulWidget {
  final int count;
  const PayoutScreen({super.key, required this.count});

  @override
  State<PayoutScreen> createState() => _PayoutScreenState();
}

class _PayoutScreenState extends State<PayoutScreen> {
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
          SingleChildScrollView(
              child: Padding(
                  padding:EdgeInsets.fromLTRB(0,200.h,0, 0),
                  child: Column( mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    Column(children: [Container(padding: EdgeInsets.fromLTRB(40, 0.h,50,10.h) ,
                      child: Hero( tag:"logo",child: Image(image: AssetImage('assets/logo.png'),height: 600.h,)),
                    )]),
                    SizedBox(height: 320.h),
                    Text("Plastic Bottle Collected:", style: TextStyle(fontSize: 60.sp, color: Colors.white)),
                    Text("${widget.count} Bottles", style: TextStyle(fontSize: 70.sp, color: Colors.white)),
                    SizedBox(height: 200.h),
                    Text("Reward Earned:", style: TextStyle(fontSize: 63.sp, color: Colors.white)),
                    SizedBox(height: 30.h,),
                    Text("0 Pesos", style: TextStyle(fontSize: 63.sp, color: Colors.white)),
                    SizedBox(height: 400.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                            TextButton(
                              style: ButtonStyle(
                              backgroundColor:WidgetStatePropertyAll(Colors.white),
                              fixedSize: WidgetStatePropertyAll(Size(350.w, 50.h)),
                              shape:WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12))
                                  )
                              )
                            ),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text("Back", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50.sp, color: Color.fromARGB(255, 27, 75, 61)),)),
                        TextButton(
                            style: ButtonStyle(
                                backgroundColor:WidgetStatePropertyAll(Colors.white),
                                fixedSize: WidgetStatePropertyAll(Size(350.w, 50.h)),
                                shape:WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12))
                                  )
                                )
                            ),
                            onPressed:(){
                                Navigator.pushNamed(context, '/reward_option');
                            },
                            child: Text("Claim", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50.sp, color: Color.fromARGB(255, 27, 75, 61))))
                      ],
                    ),
                  ])
              )
          ),
        ],
      ),
    );
  }
}

