import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interface_plasticash/screens/startup.dart';
import 'package:interface_plasticash/main.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({super.key});

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();


  List<Widget>get steps => [
    Column(crossAxisAlignment: CrossAxisAlignment.center,children: [Container(padding: EdgeInsets.fromLTRB(0.w, 300.h,0.w,50.h) ,
      child: Hero(tag:"logo",child: Image(image: AssetImage('assets/logo.png'), height:230.w,)),
    ),Text("HOW TO USE THE MACHINE?", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35.sp, color: Colors.black))]),

    Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
      Container(padding: EdgeInsets.fromLTRB(0.h, 370.h,0.h,50.h) ,
        child: Image(image: AssetImage('assets/step1.png'), height:170.w,)),
      Text("STEP 1:", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30.sp, color: Colors.black)),
      Text("PREPARE YOUR BOTTLE", style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700, color: Colors.black)),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text("Make sure the bottle is empty", style: TextStyle(fontSize: 20.sp, color: Colors.black, fontWeight: FontWeight.normal)),
      )
    ]),

    Column(children: [Container(padding: EdgeInsets.fromLTRB(0.h, 370.h,0.h,50.h) ,
      child: Image(image: AssetImage('assets/step2.png'),height:170.w),
    ),Text("STEP 2:", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30.sp, color: Colors.black)),
      Text("INSERT THE BOTTLE", style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700, color: Colors.black)),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text("Place the bottle one at a time into the deposit slot.", style: TextStyle(fontSize: 20.sp, color: Colors.black, fontWeight: FontWeight.normal), textAlign: TextAlign.center,),
      )

    ]),


    Column(children: [Container(padding: EdgeInsets.fromLTRB(0.h, 370.h,0.h,50.h) ,
      child: Image(image: AssetImage('assets/step3.png'),height:170.w,),
    ),Text("STEP 3:", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30.sp, color: Colors.black)),
      Text("CHOOSE YOUR REWARD METHOD", style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700, color: Colors.black), textAlign: TextAlign.center,),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Text("Choose to receive your reward either as cash directly \nor as points added to your app wallet.", style: TextStyle(fontSize: 20.sp, color: Colors.black, fontWeight: FontWeight.normal), textAlign: TextAlign.center,),
        ),
      )
    ]),

    Column(children: [Container(padding: EdgeInsets.fromLTRB(0.h, 370.h,0.h,50.h) ,
      child: Image(image: AssetImage('assets/step4.png'), height: 170.w,),
    ),Text("STEP 4:", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30.sp, color: Colors.black)),
      Text("CONFIRM & DONE!", style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700, color: Colors.black), textAlign: TextAlign.center,),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text("Tap Confirm and\n Receive Your Rewards", style: TextStyle(fontSize: 20.sp, color: Colors.black, fontWeight: FontWeight.normal), textAlign: TextAlign.center,),
      )])
  ];

  void _nextPage() {
    if (_currentIndex < steps.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GestureDetector(
      
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [

              Row(  children: [
                 
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    physics: NeverScrollableScrollPhysics(),  // disable swipe
                    itemCount: steps.length,
                    itemBuilder: (_, i) => steps[i],
                    onPageChanged: (i) => setState(() => _currentIndex = i),
                  ),
                ),
                
                ]
              ),
             Align(
                alignment: Alignment.centerLeft,
                child: Hero(
                  tag: "circle1",
                  child: Container(width: 180.w,decoration: BoxDecoration(color: Color.fromARGB(255, 27, 75, 61), borderRadius:BorderRadius.only(bottomRight: Radius.circular(200), topRight: Radius.circular(200)) ),)),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Hero(
                  tag: "circle2",
                  child: Container(width:  180.w,decoration: BoxDecoration(color: Color.fromARGB(255, 27, 75, 61), borderRadius:BorderRadius.only(bottomLeft: Radius.circular(200), topLeft: Radius.circular(200))  ),)),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child:TextButton(
                          style: ButtonStyle(
                            padding: WidgetStatePropertyAll(EdgeInsets.only(top: 30, left: 20)),
                              fixedSize: WidgetStatePropertyAll(Size(120.w, 900.h)),
                          ),
                          onPressed: (){
                            if(_currentIndex == steps.length - 1){
                              return;
                            }
                            else{
                              Navigator.pushNamed(context, '/deposit');
                            }
                            
                          },
                          child: Column( children: [
                            Icon(Icons.skip_next, color: _currentIndex == steps.length - 1?  Color.fromARGB(255, 27, 75, 61): Colors.white, size: 50,),
                             Text("Skip", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color:_currentIndex == steps.length - 1?  Color.fromARGB(255, 27, 75, 61):  Colors.white),)
                          ]))
              ),

              Align(

                alignment: Alignment.centerRight,
                child: TextButton(
                    style: ButtonStyle(
                          padding: WidgetStatePropertyAll(EdgeInsets.only(top: 30, right: 20)),
                            fixedSize: WidgetStatePropertyAll(Size(150.w, 900.h)),
                        ),
                    onPressed: _currentIndex != steps.length - 1 ? _nextPage: (){
                      Navigator.pushNamed(context, '/deposit');
                    },
                    child: Column(
                      children: [ Icon(Icons.arrow_right, color: Colors.white, size: 50,),
                        Text( _currentIndex == steps.length - 1
                            ? "Get Started"
                            : "Next", style: TextStyle(fontWeight: FontWeight.bold,fontSize: _currentIndex != steps.length - 1? 25.sp : 20.sp, color:  Colors.white)),
                      ],
                    ),
                    
                  
                  
                ),
              )
             
              // Curved green background at the bottom
             
      
              // Content
              ],
          ),
        ),
      ),
    );
  }
}




