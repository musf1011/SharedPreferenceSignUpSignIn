import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_pref/signInScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  Future<String?> _getFullName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('fname');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.red, Colors.black]),
        ),
        child: FutureBuilder<String?>(
          future: _getFullName(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show a loading spinner while waiting for the data
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Show an error message if something went wrong
              return Center(child: Text('There is an Error while loading your data', style: TextStyle(color: Colors.white)));
            } else if (snapshot.hasData && snapshot.data != null) {
              // Display the fetched data
              String? fullN = snapshot.data;
              return Column(
                children: [
                  SizedBox(height: 0.2.sh),
                  Center(
                    child: Text(
                      'Welcome Here $fullN',
                      style: TextStyle(fontSize: 20.sp, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 0.3.sh),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
                    },
                    child: Icon(
                      Icons.logout,
                      size: 0.1.sh,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            } else {
              // Handle the case where there is no data (fullN is null)
              return Center(
                child: Text(
                  'No user data found',
                  style: TextStyle(fontSize: 24.sp, color: Colors.white),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
