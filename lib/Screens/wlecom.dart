import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widget/custom_textstely.dart';
import 'package:page_transition/page_transition.dart';
import 'main_book.dart';
class Welcom extends StatefulWidget {
  const Welcom({super.key});

  @override
  State<Welcom> createState() => _WelcomState();
}

class _WelcomState extends State<Welcom> {

  Future<SharedPreferences > prefs =  SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Column(
          children: [
            Expanded(
                flex:3,
                child:Stack(
                  children: [
                    ClipPath(
                      clipper: RoundedClipper(630),
                      child: Container(
                        width: double.infinity,
                        child:Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                           Padding(padding: EdgeInsets.all(80),
                           child:  Text('Welcom us in Application',style: TextStyle(

                               fontSize: 20,
                               fontWeight: FontWeight.bold
                           ),),

                           )
                          ],),
                        decoration: BoxDecoration(
                            color: Colors.green
                          //  borderRadius: BorderRadius.circular(25),

                        ),
                      ),
                    ),

                    Positioned(
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 120,

                      ),
                      left: -40,
                      top: -30.0,
                    ),
                  Positioned(
                    left: 70,
                    top: 100,
                    child:Image(image:AssetImage('images/img_1.png'),height: 300,width: 300,),)
                  ],
                )
            ),
            Expanded(
              flex:1,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                  ),
                  child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                         fixedSize: Size(200,40)),
                    child: Padding(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Next   ..... ',style:CustomTextStely()),
                          Icon(Icons.arrow_forward,color: Colors.black.withOpacity(0.5))
                        ],),
                      padding: EdgeInsets.all(10),
                    ),
                    onPressed: (){
                      Navigator.of(context).pushReplacement( PageTransition(
                        type: PageTransitionType.leftToRight,
                        child: Ex(),
                      ),
                      );
                    }
                  ),
                  ),
                ),
              ),
          ],
        ) ,
    );
  }

}
class RoundedClipper extends CustomClipper<Path> {
  final double height;

  RoundedClipper(this.height);

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, height - 70);
    path.quadraticBezierTo(
      size.width / 2,
      height,
      size.width,
      height - 70,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
