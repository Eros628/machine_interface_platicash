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
      child: Hero(tag:"logo",child: Image(image: AssetImage('assets/logo.png'), height:900.h,)),
    ),Text("HOW TO USE THE MACHINE?", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 55.sp, color: Colors.black))]),

    Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
      Container(padding: EdgeInsets.fromLTRB(0.w, 300.h,0.w,30.h) ,
        child: Image(image: AssetImage('assets/step1.png'), height:700.h,)),
      Text("STEP 1:", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 55.sp, color: Colors.black)),
      Text("PREPARE YOUR BOTTLE", style: TextStyle(fontSize: 55.sp, fontWeight: FontWeight.w700, color: Colors.black)),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text("Make sure the bottle is empty", style: TextStyle(fontSize: 35.sp, color: Colors.black, fontWeight: FontWeight.normal)),
      )
    ]),

    Column(children: [Container(padding: EdgeInsets.fromLTRB(0.w, 300.h,0.w,50.h) ,
      child: Image(image: AssetImage('assets/step2.png'),height:600.h),
    ),Text("STEP 2:", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 55.sp, color: Colors.black)),
      Text("INSERT THE BOTTLE", style: TextStyle(fontSize: 55.sp, fontWeight: FontWeight.w700, color: Colors.black)),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text("Place the bottle one at a time into the deposit slot.", style: TextStyle(fontSize: 35.sp, color: Colors.black, fontWeight: FontWeight.normal), textAlign: TextAlign.center,),
      )

    ]),


    Column(children: [Container(padding: EdgeInsets.fromLTRB(0.w, 350.h,0.w,50.h) ,
      child: Image(image: AssetImage('assets/step3.png'),height:570.h,),
    ),Text("STEP 3:", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 55.sp, color: Colors.black)),
      Text("CHOOSE YOUR REWARD METHOD", style: TextStyle(fontSize: 45.sp, fontWeight: FontWeight.w700, color: Colors.black), textAlign: TextAlign.center,),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Text("Choose to receive your reward either as cash directly or as points added to your app wallet.", style: TextStyle(fontSize: 35.sp, color: Colors.black, fontWeight: FontWeight.normal), textAlign: TextAlign.center,),
        ),
      )
    ]),

    Column(children: [Container(padding: EdgeInsets.fromLTRB(0.w, 300.h,0.w,30.h) ,
      child: Image(image: AssetImage('assets/step4.png'), height: 700.h,),
    ),Text("STEP 4:", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 55.sp, color: Colors.black)),
      Text("CONFIRM & DONE!", style: TextStyle(fontSize: 55.sp, fontWeight: FontWeight.w700, color: Colors.black), textAlign: TextAlign.center,),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text("Tap Confirm and\n Receive Your Rewards", style: TextStyle(fontSize: 35.sp, color: Colors.black, fontWeight: FontWeight.normal), textAlign: TextAlign.center,),
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
    return GestureDetector(

      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(height: 240.h,width: 260.w,decoration: BoxDecoration(color: Color.fromARGB(255, 27, 75, 61), borderRadius:BorderRadius.only(bottomLeft: Radius.circular(200)) ),),
            )  ,
            // Curved green background at the bottom
            Align(
                alignment: Alignment.bottomCenter,
                child: Stack(children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(40.w, 10, 50.w,0),
                    child: Hero(tag:"bottomup1",child: Row(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.spaceBetween,children:[Image(image:AssetImage('assets/leaf2.png')), Image(image:AssetImage('assets/leaf1.png'))])),
                  ),
                  Hero(
                    tag: "bottomup",
                    child: ClipPath(
                      clipper: BottomCurveClipper(),
                      child: Container(
                        color: Color.fromARGB(255, 27, 75, 61), // Your green color
                        height: 1000.h,
                      ),
                    ),
                  )
                ])
            ),

            // Content
            Column( mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: NeverScrollableScrollPhysics(),  // disable swipe
                  itemCount: steps.length,
                  itemBuilder: (_, i) => steps[i],
                  onPageChanged: (i) => setState(() => _currentIndex = i),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0,0.h,0,160.h),
                child: Row(
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
                        )  ,
                        onPressed: (){
                          Navigator.pushNamed(context, '/deposit');
                        },
                        child: Text("Skip", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50.sp, color:  Color.fromARGB(255, 27, 75, 61)),)),
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor:WidgetStatePropertyAll(Colors.white),
                            fixedSize: WidgetStatePropertyAll(Size(350.h, 50.w)),
                            shape:WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12))
                                )
                            )
                        ),
                        onPressed: _currentIndex != steps.length - 1 ? _nextPage: (){
                          Navigator.pushNamed(context, '/deposit');
                        },
                        child: Text( _currentIndex == steps.length - 1
                            ? "Get Started"
                            : "Next", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50.sp, color:  Color.fromARGB(255, 27, 75, 61))),
                        
                      

                    )
                  ],
                ),
              )
              ]
            )],
        ),
      ),
    );
  }
}




