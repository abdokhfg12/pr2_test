import 'package:fhgfh/screen/homepage.dart';
import 'package:fhgfh/screen/login_screen%20(5)%20(1).dart';
import 'package:fhgfh/screen/page1.dart';
import 'package:fhgfh/screen/page2.dart';
import 'package:fhgfh/screen/page3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Startscreen extends StatefulWidget {
  const Startscreen({Key? key}) : super(key: key);

  @override
  State<Startscreen> createState() => _StartscreenState();
}

class _StartscreenState extends State<Startscreen> {
  PageController _controller=PageController();
  bool onLastPage=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height:840,
          child: PageView(controller: _controller,
            onPageChanged: (index){
            setState(() {
              onLastPage=(index==2);

            });
            },
            children: [
              Page1(),
              Page2(),
              Page3(),
            ],
          ), 
          ),

          Container(
            alignment: Alignment(0,1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Text("skip")),
                SmoothPageIndicator(controller: _controller, count: 3),
                onLastPage?
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginScreeeen();
                              },
                            ),
                          );
                        },
                    child: Text("done"),):
                GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                        duration: Duration(microseconds: 400),
                        curve: Curves.easeIn);
                  },
                  child: Text("next"),

                ), ],
            ),
          )
          
          
        ],
      ),
      
    );
  }
}
