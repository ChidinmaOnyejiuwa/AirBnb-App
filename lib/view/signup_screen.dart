import 'dart:io';

import 'package:airbnb_app/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
{
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController = TextEditingController();
  TextEditingController _firstNameTextEditingController = TextEditingController();
  TextEditingController _lastNameTextEditingController = TextEditingController();
  TextEditingController _cityTextEditingController = TextEditingController();
  TextEditingController _countryTextEditingController = TextEditingController();
  TextEditingController _bioTextEditingController = TextEditingController();
  final _formKey= GlobalKey<FormState>();

  File? imageFileOfUser;


  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
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
        ),
        title: const Text(
          "Create New Account",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
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

            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0,),
              child: Image.asset(
                "images/signup.png",
                width: 200,
              ),
            ),
            const Text(
              "Tell us who you are",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
              textAlign: TextAlign.center,
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                Padding(
                padding: const EdgeInsets.only(top: 26),
                  child: TextFormField(
                    controller: _emailTextEditingController,
                    validator: (text)
                    {
                      if(text!.isEmpty)
                      {
                        return"Please write a valid email";
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
                          fontSize: 24,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 21),
                      child: TextFormField(
                        controller: _firstNameTextEditingController,
                        validator: (text)
                        {
                          if(text!.isEmpty)
                          {
                            return "Please write your First Name";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            labelText: "FirstName"),
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                        textCapitalization: TextCapitalization.words,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 21),
                      child: TextFormField(
                        controller: _lastNameTextEditingController,
                        validator: (text)
                        {
                          if(text!.isEmpty)
                          {
                            return "Please write your Last Name";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            labelText: "LastName"),
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                        textCapitalization: TextCapitalization.words,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 21),
                      child: TextFormField(
                        controller: _cityTextEditingController,
                        validator: (text)
                        {
                          if(text!.isEmpty)
                          {
                            return "Please write your City name";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            labelText: "City"),
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                        textCapitalization: TextCapitalization.words,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 21),
                      child: TextFormField(
                        controller: _countryTextEditingController,
                        validator: (text)
                        {
                          if(text!.isEmpty)
                          {
                            return "Please write the name of your Country";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            labelText: "Country"),
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                        textCapitalization: TextCapitalization.words,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 21),
                      child: TextFormField(
                        controller: _bioTextEditingController,
                        decoration: const InputDecoration(
                            labelText: "Bio"),
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                        maxLines: 5,
                        textCapitalization: TextCapitalization.words,
                      ),
                    ),

                  ],
                )
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 36.0),
              child: MaterialButton(
                  onPressed: ()
                  {

              },
                child: imageFileOfUser == null ?
                const Icon(Icons.add_a_photo)
                    : CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: MediaQuery.of(context).size.width / 5.0,
                  child: CircleAvatar(
                    backgroundImage: FileImage(imageFileOfUser!),
                    radius: MediaQuery.of(context).size.width / 5.0,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 34.0, right: 40.0, left: 40.0),
              child: ElevatedButton(
                onPressed: ()
                {
                if(!_formKey.currentState!.validate()|| imageFileOfUser == null)
                {
                  Get.snackbar("Field Missing",
                      "Please choose image and fill the signup form completely");
                  return;
                }
                if(_emailTextEditingController.text.isEmpty &&
                    _passwordTextEditingController.text.isEmpty)
                {
                  Get.snackbar("Field Missing",
                      "Please fill the signup form completely");
                  return;
                }
                userViewModel.signUp(
                  _emailTextEditingController.text.trim(),
                  _passwordTextEditingController.text.trim(),
                  _firstNameTextEditingController.text.trim(),
                  _lastNameTextEditingController.text.trim(),
                  _cityTextEditingController.text.trim(),
                  _countryTextEditingController.text.trim(),
                  _bioTextEditingController.text.trim(),
                  imageFileOfUser,
                );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
                child: const Text (
                  "Create Account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 60,
            )


          ],
        ),
      ),
    );
  }
}
