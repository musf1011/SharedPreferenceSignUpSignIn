import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_pref/mainScreen.dart';
import 'package:shared_pref/signInScreen.dart';
import 'package:shared_pref/welcomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController fullname=TextEditingController();

  final TextEditingController emailContr=TextEditingController();  

  final TextEditingController passw = TextEditingController();

  final TextEditingController cpassw = TextEditingController();

  int password=-1; // 0: mismatch, 1: match, 2: empty password, 3: empty confirm password

  int gmail = -1;

  int fullName = -1;
  bool _isPasswordVisible=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.red,Colors.black])),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(.008.sh ,.015.sh,.05.sw,0 ),
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
                padding: EdgeInsets.fromLTRB(0,0,.4.sw,.05.sh),
                child: Text('Create Your\nAccount',style: TextStyle(fontSize: 30.sp,color: Colors.white),),
              ),
              Container(
                // height: .737.sh,
                // width: 1.sw,
                decoration: BoxDecoration(color: Color.fromARGB(250, 225, 250, 250),borderRadius: BorderRadius.circular(20)),
                child:  Padding(
          padding: EdgeInsets.fromLTRB(0.05.sw,.02.sh, .05.sw,0),
          child:  Column(
            children: [
              fullName==0? Text('*Full Name can\'t be empty',style: TextStyle(color: Color.fromARGB(255, 113, 12, 31),fontSize: 12.sp)):SizedBox(height: 0.03.sh,),
              TextField(
                controller: fullname,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Billy Boy',
                  labelStyle: TextStyle(color: Colors.red),
                  suffixIcon: Icon(Icons.check,  color: fullName==1? Colors.green :  Colors.grey,),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              gmail==0? Text('*Phone or Gmail can\'t be empty',style: TextStyle(color: Color.fromARGB(255, 113, 12, 31),fontSize: 12.sp)):SizedBox(height: 0.03.sh,),
              TextField(
                controller: emailContr,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Phone or Gmail',
                  hintText: 'you@gmail.com',
                  labelStyle: TextStyle(color: Colors.red),
                  suffixIcon: Icon(Icons.check,  color: gmail==1? Colors.green :  Colors.grey,),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              SizedBox(height: .03.sh,),
              TextField(
                obscureText: _isPasswordVisible==false? true:false,
                controller: passw,
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
               password==0? (Text('*Passwords doesn\'t match',style: TextStyle(color: Color.fromARGB(255, 113, 12, 31),fontSize: 12.sp))):   (password==2? Text('*Passwords can\'t be empty',style: TextStyle(color: Color.fromARGB(255, 113, 12, 31),fontSize: 12.sp)): (password==3? Text('*Confirm your Password',style: TextStyle(color: Color.fromARGB(255, 113, 12, 31),fontSize: 12.sp)):SizedBox(height: 0.03.sh,))),             
              TextField(
                obscureText: _isPasswordVisible==false? true:false,
                controller: cpassw,
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
              SizedBox(height: .087.sh,),
              // GestureDetector(
              //   onTap: ()  {
              //     setState(() async {
              //       String fn = fullname.text;
              //       String gm = emailContr.text;
              //       String pw = passw.text;
              //       String cpw = cpassw.text;
              //       if(gm!='')
              //       {
              //         gmail=1;
              //       }
              //       else{
              //         gmail=0;
              //       }
              //       if(fn!='')
              //       {
              //         fullName=1;
              //       }
              //       else{
              //         fullName=0;
              //       }
              //       if(pw!=cpw)
              //       {
              //         password=0;
              //       }
              //       if(pw==cpw)
              //       {
              //         password=1;
              //       }
              //       if(pw=='')
              //       {
              //         password=2;
              //       }
              //       else if(cpw=='')
              //       {
              //         password=3;
              //       }
              //       if(password==1 && fullName==1 && gmail==1)
              //       {
              //         SharedPreferences prefs = await SharedPreferences.getInstance();
              //         prefs.setString('fname',fn);
              //         prefs.setString('email', gm);
              //         prefs.setString('pass', pw);
              //       }
              //       print(password);
              //   print('$fn');
              //   print(cpw);
              //   print(password);
              //     }
              //   );
              //   },
              //   child: Container(
              //     width: .75.sw,
              //     height: .075.sh,
              //     decoration: BoxDecoration(
              //       gradient: LinearGradient(colors: [Colors.red,Colors.black]),
              //       borderRadius: BorderRadius.circular(50)
              //     ),
              //     child: Center(child: Text('SIGN UP',style: TextStyle(fontSize: 18.sp,color: Colors.white),)) ,
              //   ),
              // ),


             GestureDetector(
  onTap: () async {
    // Perform asynchronous operations outside of setState
    String fn = fullname.text;
    String gm = emailContr.text;
    String pw = passw.text;
    String cpw = cpassw.text;

    int gmailStatus = gm.isNotEmpty ? 1 : 0;
    int fullNameStatus = fn.isNotEmpty ? 1 : 0;
    int passwordStatus;

    if (pw.isEmpty) {
      passwordStatus = 2; // Password is empty
    } else if (cpw.isEmpty) {
      passwordStatus = 3; // Confirm password is empty
    } else if (pw != cpw) {
      passwordStatus = 0; // Passwords don't match
    } else {
      passwordStatus = 1; // Passwords match
    }

    if (passwordStatus == 1 && fullNameStatus == 1 && gmailStatus == 1) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('fname', fn);
      await prefs.setString('email', gm);
      await prefs.setString('pass', pw);

      // Navigate to SignIn screen or other screen after saving data
      Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
    }

    // Update the UI inside setState
    setState(() {
      gmail = gmailStatus;
      fullName = fullNameStatus;
      password = passwordStatus;
    });
  },
  child: Container(
    width: .75.sw,
    height: .075.sh,
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [Colors.red, Colors.black]),
      borderRadius: BorderRadius.circular(50),
    ),
    child: Center(
      child: Text('SIGN UP', style: TextStyle(fontSize: 18.sp, color: Colors.white)),
    ),
  ),
),




              SizedBox(height: .07.sh,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.grey,fontSize: 12.sp),
                  ),
                  SizedBox(width: 8.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ]
              )
              )
          ),
            ]
            )
        ),
      )
    );
  }
}