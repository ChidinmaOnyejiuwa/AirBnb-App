import 'package:airbnb_app/view/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.amber,
            ],
            begin: FractionalOffset(0, 0),
            end: FractionalOffset(1, 0),
            stops: [0, 1],
            tileMode: TileMode.clamp,
          ),
        ),
        child: ListView(
          children: [
            Image.asset("images/logo.png"),
            const Text(
              "Login here,\nwelcome Back",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                letterSpacing: 3,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 26),
                      child: TextFormField(
                        controller: _emailTextEditingController,
                        validator: (valueEmail)
                        {
                          if(!valueEmail!.contains("@"))
                          {
                            return"Please write your email";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            labelText: "Email"),
                        style: const TextStyle(
                          fontSize: 24,

                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 21),
                      child: TextFormField(
                        controller: _passwordTextEditingController,
                        validator: (valuePassword)
                        {
                          if(valuePassword!.length < 5)
                          {
                            return "Password must be atleast 6 or more characters";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            labelText: "Password"),
                        style: const TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: ElevatedButton(
                        onPressed: ()
                            {
                            if (_formKey.currentState!.validate())
                            {

                            }
                            },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          padding: const EdgeInsets.symmetric(horizontal: 60),

                        ),
                        child: const Text (
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    TextButton(
                        onPressed:()
                        {
                          Get.to(SignUpScreen());
                        },
                      child: const Text (
                        "Don't have an account? Sign up",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 60,
                    )

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
