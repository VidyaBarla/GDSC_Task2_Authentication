import 'package:authentication/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:authentication/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return const HomeScreen();
          } else{
            return const SignInScreen();
          }
        }
      ),
    );
    
  }
}