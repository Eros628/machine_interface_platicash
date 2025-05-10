import 'package:flutter/material.dart';
import 'package:interface_plasticash/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interface_plasticash/screens/startup.dart';
class RewardOptions extends StatefulWidget {
  const RewardOptions({super.key});

  @override
  State<RewardOptions> createState() => _RewardOptionsState();
}

class _RewardOptionsState extends State<RewardOptions> {
  int payout = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      height: 900.h,
                    ),
                  ),
                )
              ])
          ),

          // Content
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: TextButton(
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
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50.w,550.h,40.w,0.h),
            child: Column(
              spacing: 50.h,
              children: [
                Text("Choose Your Payout Options", style: TextStyle(color: Color.fromARGB(255, 27, 75, 61), fontSize: 60.sp, fontWeight: FontWeight.bold),),
                Row(
                  spacing: 50.w,
                  children: [
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 27, 75, 61)),
                            fixedSize: WidgetStatePropertyAll(Size(467.w, 580.h)),
                            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))))

                        ),
                        
                        onPressed: (){
                          setState(() {
                            payout = 1;
                          });
                          Navigator.pushNamed(context, '/message', arguments: payout);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                'assets/payout1.png'
                            ),
                            Text("Payout Directly", style: TextStyle(color: Colors.white),)
                          ],
                        ),
                    ),

                    TextButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 27, 75, 61)),
                            fixedSize: WidgetStatePropertyAll(Size(467.w, 580.h)),
                            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))))

                        ),
                       
                        onPressed: (){
                          setState(() {
                            payout = 2;
                          });
                          Navigator.pushNamed(context, '/qr_code');
                        },
                        child: Column(
                          spacing: 40.h,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/payout2.png"
                            ),

                            Text("Via App", style: TextStyle(color: Colors.white),)
                          ],
                        ),
                    )
                  ],
                ),
              ],
            ),
          )
        
        ],
      ),
    );
  }
}
