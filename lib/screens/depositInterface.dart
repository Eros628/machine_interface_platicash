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
    return PopScope(
      canPop: false,
      child: GestureDetector(
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
                alignment: Alignment.centerRight,
                child: Hero(
                  tag: "circle2",
                  child: Container(width:  600.w,decoration: BoxDecoration(color: Color.fromARGB(255, 27, 75, 61), borderRadius:BorderRadius.only(bottomLeft: Radius.circular(100), topLeft: Radius.circular(100))  ),)),
              ),
              

      
              // Content
              SingleChildScrollView(
                  child: Padding(
                      padding:EdgeInsets.fromLTRB(50.h,80.w,90.w, 0),
                      child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                        Container(padding: EdgeInsets.fromLTRB(60.w, 0.h,50.w,10.h) ,
                          child: Hero( tag:"logo",child: Image(image: AssetImage('assets/logo.png'),height: 300.w,)),
                        ),
                        SizedBox(width: isOpen? 208.w: 150.w,),
                        BlinkingText(isOpen == true ? "OPENING       " : "START DEPOSIT", fontSize: 40.sp, color: Colors.white),
                      ])
                  )
              ),
            ],
          ),
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

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: Hero(
                  tag: "circle2",
                  child: Container(width:  650.w,decoration: BoxDecoration(color: Color.fromARGB(255, 27, 75, 61), borderRadius:BorderRadius.only(bottomLeft: Radius.circular(100), topLeft: Radius.circular(100))  ),)),
              ),
      
            // Content
            SingleChildScrollView(
                child: Padding(
                    padding:EdgeInsets.fromLTRB(0,70.w,0, 0),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.center, children: [
                      Column(children: [Container(padding: EdgeInsets.fromLTRB(40.w, 0.h,50.w,80.w) ,
                        child: Hero( tag:"logo",child: Image(image: AssetImage('assets/logo.png'),height: 290.w,)),
                      )]),
                     
                      Column(
                        children: [
                          Text("$count", style: TextStyle(fontSize: 40.sp, color: Colors.white),),
                          Text("Plastic Bottle Collected", style: TextStyle(fontSize: 40.sp, color: Colors.white)),
                          SizedBox(height: 290.h),
                          BlinkingText("READY TO DEPOSIT",fontSize: 30.sp, color: Colors.white),
                          SizedBox(height: 30.h,),
                          Text("Place the bottle one at a time\n into the deposit slot", style: TextStyle(fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.normal), textAlign: TextAlign.center,),
                          SizedBox(height: 180.h,),
                          Row(
                          spacing:100.w,
                          children: [
                            TextButton(
                                style: ButtonStyle(
                                    backgroundColor:WidgetStatePropertyAll(Colors.white),
                                    fixedSize: WidgetStatePropertyAll(Size(150.w, 50.h)),
                                    shape:WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10)
                                        )
                                    )
                                ),
                                onPressed: (){
                                },
                                child: Text("Cancel", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.sp, color: Color.fromARGB(255, 27, 75, 61)),)),
                            TextButton(
                                style: ButtonStyle(
                                  backgroundColor:WidgetStatePropertyAll(Colors.white),
                                  fixedSize: WidgetStatePropertyAll(Size(150.w, 50.h)),
                                  shape:WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))
                                  )
                                ),
        
                                onPressed:(){
                                    Navigator.pushNamed(context, '/payout', arguments: count);
                                },
                                child: Text("Payout", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.sp, color: Color.fromARGB(255, 27, 75, 61))))
                              ],
                            ),
                          ],
                        ),
                      ])
                )
            ),
          ],
        ),
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
    final int points = widget.count * 1; 
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
           Align(
                alignment: Alignment.centerRight,
                child: Hero(
                  tag: "circle2",
                  child: Container(width:  650.w,decoration: BoxDecoration(color: Color.fromARGB(255, 27, 75, 61), borderRadius:BorderRadius.only(bottomLeft: Radius.circular(100), topLeft: Radius.circular(100))  ),)),
              ),
      
            // Content
            SingleChildScrollView(
                child: Padding(
                    padding:EdgeInsets.fromLTRB(0,70.w,0, 0),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.center, children: [
                      Column(children: [Container(padding: EdgeInsets.fromLTRB(40.w, 0.h,50.w,80.w) ,
                        child: Hero( tag:"logo",child: Image(image: AssetImage('assets/logo.png'),height: 290.w,)),
                      )]),
                     
                      Column(
                        children: [
                           Text("Plastic Bottle Collected", style: TextStyle(fontSize: 40.sp, color: Colors.white)),
                          Text("${widget.count}", style: TextStyle(fontSize: 40.sp, color: Colors.white, fontWeight: FontWeight.normal)),
                          SizedBox(height: 150.h,),
                          Text("Reward Earned ", style: TextStyle(fontSize: 40.sp, color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                          Text("$points Pesos ", style: TextStyle(fontSize: 40.sp, color: Colors.white, fontWeight: FontWeight.normal), textAlign: TextAlign.center,),
                          SizedBox(height: 200.h,),
                          Row(
                          spacing:100.w,
                          children: [
                            TextButton(
                                style: ButtonStyle(
                                    backgroundColor:WidgetStatePropertyAll(Colors.white),
                                    fixedSize: WidgetStatePropertyAll(Size(150.w, 50.h)),
                                    shape:WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10)
                                        )
                                    )
                                ),
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.sp, color: Color.fromARGB(255, 27, 75, 61)),)),
                            TextButton(
                                style: ButtonStyle(
                                  backgroundColor:WidgetStatePropertyAll(Colors.white),
                                  fixedSize: WidgetStatePropertyAll(Size(150.w, 50.h)),
                                  shape:WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))
                                  )
                                ),
        
                                onPressed:(){
                                    Navigator.pushNamed(context, '/reward_option', arguments: widget.count);
                                },
                                child: Text("Confirm", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.sp, color: Color.fromARGB(255, 27, 75, 61))))
                              ],
                            ),
                          ],
                        ),
                      ])
                )
            ),
          ],
        ),
      ),
    );
  }
}

