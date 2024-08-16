import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_pref/signInScreen.dart';
import 'package:shared_pref/signUpScreen.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.red, Colors.black]),
        ),
        child: Column(
          children: [
            SizedBox(height: .015.sh,),
            Container(
                width: .9.sw, // Ensure the row takes the full width of the screen
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.more_horiz,color: Colors.white,size: .04.sh,),
                  ],
                ),
              ),
             SizedBox(height: .17.sh),
              FaIcon(FontAwesomeIcons.dumbbell,color: Colors.white ,size: .14.sh,),
            Text(
              'Fitness Club',
              style: TextStyle(
                  fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: .09.sh),
            Text(
              'Welcome Back',
              style: TextStyle(
                  fontSize: 25.sp, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: .03.sh),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
              },
              child: Container(
                height: .08.sh,
                width: .7.sw,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.white)),
                child: Center(
                  child: Text('Sign In',style: TextStyle(
                      fontSize: 15.sp, color: Colors.white)),
                )
                ),
            ),
               SizedBox(height: .03.sh),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
              },
              child: Container(
                height: .08.sh,
                width: .7.sw,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50),),
                child: Center(
                  child: Text('Sign Up',style: TextStyle(
                      fontSize: 15.sp, color: Colors.black)),
                )
                ),
            ),
              SizedBox(height: .1.sh,),
              Text('Login with Social Media',style: TextStyle(color: Colors.white,fontSize: 11.sp),),
              SizedBox(height: .01.sh,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   CircleAvatar(backgroundColor: Colors.white, child: FaIcon(FontAwesomeIcons.instagram,size: .04.sh,)),
                   SizedBox(width: .01.sw),
                  CircleAvatar(backgroundColor: Colors.white, child: FaIcon(FontAwesomeIcons.twitter,size: .04.sh)),
                  SizedBox(width: .01.sw),
                  CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.facebook,size: .04.sh,)),
                 
                ],
              ),
              SizedBox(height: 0.001.sh,)
          ],
        ),
      ),
    );
  }
}
