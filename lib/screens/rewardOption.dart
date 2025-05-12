import 'package:flutter/material.dart';
import 'package:interface_plasticash/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interface_plasticash/screens/startup.dart';


class RewardOptions extends StatefulWidget {
  final int count;
  const RewardOptions({super.key, required this.count});

  @override
  State<RewardOptions> createState() => _RewardOptionsState();
}

class _RewardOptionsState extends State<RewardOptions> {

  int payout = 0;
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
                  child: Container(decoration: BoxDecoration(color:  Color.fromARGB(255, 27, 75, 61) ),)),
              ),
            // Content
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:WidgetStatePropertyAll( Colors.white),
                        fixedSize: WidgetStatePropertyAll(Size(150.w, 50.h)),
                        shape:WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12))
                            )
                        )
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("Back", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.sp, color: Color.fromARGB(255, 27, 75, 61)),)),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50.h,50.w,40.h,0.w),
              child: Column(
                spacing: 130.h,
                children: [
                  Text("Choose Your Payout Options", style: TextStyle(color: Colors.white, fontSize: 30.sp, fontWeight: FontWeight.bold),),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 50.w,
                    children: [
                      TextButton(
                          style: ButtonStyle(   
                              fixedSize: WidgetStatePropertyAll(Size(267.w, 280.w)),
                              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)), side: BorderSide(color: Colors.white)))
      
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
                              Text("Payout Directly", style: TextStyle(color: Colors.white, fontSize: 20.sp),)
                            ],
                          ),
                      ),
      
                      TextButton(
                          style: ButtonStyle(
                              fixedSize: WidgetStatePropertyAll(Size(267.w, 280.w)),
                              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)), side: BorderSide(color: Colors.white)))
      
                          ),
                         
                          onPressed: (){
                            setState(() {
                              payout = 2;
                            });
                            Navigator.pushNamed(context, '/qr_code', arguments: widget.count);
                          },
                          child: Column(
                            spacing: 40.h,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/payout2.png"
                              ),
      
                              Text("Via App", style: TextStyle(color: Colors.white, fontSize: 20.sp),)
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
      ),
    );
  }
}
