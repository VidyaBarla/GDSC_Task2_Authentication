import 'package:authentication/components/square_tile.dart';
import 'package:authentication/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}):super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  //Text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.account_circle_outlined,
                  size:100,
                ),

                const SizedBox(height:20),

                Text(
                  'HELLO',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                  ),
                ),
                const SizedBox(height:5),
                const Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize:20,
                  ),
                ),
                const SizedBox(height:40),

                //email texfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25.0) ,
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Email',
                      fillColor: Colors.teal[50],
                      filled:true,
                    ),
                  ),
                ), 
                const SizedBox(height:10),

                //password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25.0) ,
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Password',
                      fillColor: Colors.teal[50],
                      filled:true,
                    ),
                  ),
                ),
                const SizedBox(height:10),

                //sign in button
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal:25.0),
                  child:GestureDetector(
                    onTap:signIn,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.pink[600],
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: const Center(
                        child: Text( 
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight:FontWeight.bold,
                            fontSize:18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height:25),

                //or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.brown[900],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Or continue with",
                          style: TextStyle(
                            color: Colors.brown),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.brown[900],
                        ),
                      ),
                    ],
                    ),
                ),

                const SizedBox(height:15),

                //google sign in button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: 'lib/images/google.png',
                    )
                  ],
                ),

                const SizedBox(height:50),

                //not a member? register now
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Not a member?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:18,
                    ),
                  ),  
                  Text(
                    'Register now',
                    style:TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize:16,
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
    
    
  }
}