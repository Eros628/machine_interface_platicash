import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interface_plasticash/main.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/guide');
      },
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
            SingleChildScrollView(
                child: Padding(
                    padding:EdgeInsets.fromLTRB(50,122.h,50,0.h),
                    child: Column( mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                      Column(children: [Container(padding: EdgeInsets.fromLTRB(0.w, 0.h,0.w,10.h) ,
                        child: Hero(tag:"logo",child: Image(image: AssetImage('assets/logo.png'),)),
                      ),Text("BOTTLE IT UP, CASH IT OUT", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 55.sp, color: Colors.black)), Text("You don't need therapy you need money :D", style: TextStyle(fontSize: 30.sp, color: Colors.black, fontWeight: FontWeight.normal))]),
                      SizedBox(height: 700.h,),
                      BlinkingText("Tap To Deposit", fontSize: 50.sp, color: Colors.white)]
                )
            ),
            )],
        ),
      ),
    );
  }
}

// Custom Blinking Text Widget
class BlinkingText extends StatefulWidget {
  final String text;
  final double fontSize;
  final Color color;

  const BlinkingText(this.text, {super.key, required this.fontSize, required this.color});

  @override
  _BlinkingTextState createState() => _BlinkingTextState();
}

class _BlinkingTextState extends State<BlinkingText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      upperBound: 1.0,
      lowerBound: 0.0,
    );

    // Create an opacity animation
    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start the blinking effect by repeating the animation
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Text(
            widget.text,
            style: TextStyle(fontSize: widget.fontSize, color: widget.color),
          ),
        );
      },
    );
  }
}


// Custom clipper for the curved background
class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 90);
    path.quadraticBezierTo(size.width / 2 ,0, size.width, 90);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
