import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_pref/mainScreen.dart';
import 'package:shared_pref/signUpScreen.dart';
import 'package:shared_pref/welcomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
   SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

final TextEditingController emailCont = TextEditingController();

final TextEditingController passcont = TextEditingController();

bool _isPasswordVisible = false;

int cred = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.red,Colors.black])),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(.005.sw,.015.sh,.05.sw,0 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Welcome()));
                    },
                    child: Icon(Icons.arrow_back,color: Colors.white,size: .05.sh,)),
                  Icon(Icons.more_horiz,color: Colors.white,size: .04.sh)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0,0,.55.sw,.1.sh),
              child: Text('Hello\nSign in!',style: TextStyle(fontSize: 30.sp,color: Colors.white),),
            ),
            Container(
              height: .687.sh,
              width: 1.sw,
              decoration: BoxDecoration(color: Color.fromARGB(250, 225, 250, 250),borderRadius: BorderRadius.circular(20)),
              child:  Padding(
        padding: EdgeInsets.fromLTRB(.05.sw,.05.sh, .05.sw,0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailCont,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Gmail',
                hintText: 'you@gmail.com',
                labelStyle: TextStyle(color: Colors.red),
                suffixIcon: Icon(Icons.check,  color: cred==0? Colors.red :  Colors.grey,),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: .05.sh),
            TextField(
              obscureText: _isPasswordVisible==false? true:false,
              controller: passcont,
              decoration: InputDecoration(
                hintText: 'password',
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.red),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: 0.01.sh),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot password?',
                style: TextStyle(color: Colors.grey,fontSize: 12.sp),
              ),
            ),
            SizedBox(height: .01.sh),
           cred==0? Text('*Complete the credentials',style: TextStyle(color: Color.fromARGB(255, 113, 12, 31),fontSize: 12.sp)):cred==2? Text('*Incorrect Password',style: TextStyle(color: Color.fromARGB(255, 113, 12, 31),fontSize: 12.sp)):SizedBox(height: 0.03.sh,),
           GestureDetector(
            onTap: () async{
                String g=emailCont.text;
                String p=passcont.text;
                  
              SharedPreferences prefs = await SharedPreferences.getInstance();
              String? em = prefs.getString('email');
              String? ps = prefs.getString('pass');
              if(ps==p && em==g)
              {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
              }
              else if(g=='' || p=='')
              {
                setState(() {
                cred=0;
                });
                print('is empty');
              }
              else if(g==em && p!=ps)
              {
                setState(() {
                  cred=2;
                });
                print(cred);
              }
              else
                print(cred);
            },
             child: Container(
              height: .075.sh,
              width: .75.sw,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.red,Colors.black]),
                borderRadius: BorderRadius.circular(50)
              ),
              child: Center(child: Text('SIGN IN',style: TextStyle(fontSize: 18.sp,color: Colors.white),)),
             ),
           ),
            SizedBox(height: .15.sh),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.grey,fontSize: 12.sp),
                ),
                SizedBox(width: 8.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),)

                ],
              ),
            ));
         
  }
}