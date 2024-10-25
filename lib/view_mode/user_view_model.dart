import 'dart:io';

import 'package:airbnb_app/model/app_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserViewModel {
  signUp(email,password, firstName, lastName, city, country, bio, imageFileOfUser) async
  {
    Get.snackbar("Please wait", "for your account to be created.");

  try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((result) async
    {
      String currentUserID = result.user!.uid;

      AppConstants.currentUser.id = currentUserID;
      AppConstants.currentUser.firstName = firstName;
      AppConstants.currentUser.lastName = lastName;
      AppConstants.currentUser.city = city;
      AppConstants.currentUser.country = country;
      AppConstants.currentUser.bio = bio;
      AppConstants.currentUser.email = email;
      AppConstants.currentUser.password = password;

      await  saveUserToFirestore(bio, city, country, email, firstName, lastName, currentUserID).
      whenComplete(()  async
      {
        await  addAndUpLoadImageToFirebaseStorage(imageFileOfUser, currentUserID);
      });
      Get.snackbar("Congratulatons", "your account has been created.");
    });
  }
  catch(e)
  {
    Get.snackbar("Error", e.toString());
  }
  }

  Future<void> saveUserToFirestore(
      bio,
      city,
      country,
      email,
      firstName,
      lastName,
      id) async
  {
    Map<String, dynamic> dataMap =
    {
      "bio": bio,
      "city": city,
      "country": country,
      "email": email,
      "fistName": firstName,
      "lastName": lastName,
      "isHost": false,
      "myPostingIDs": [],
      "savePostingIDs": [],
      "earning": 0,
    };
    await FirebaseFirestore.instance.collection("users").doc(id).set(dataMap);
  }

  addAndUpLoadImageToFirebaseStorage(File imageFileOfUser, currentUserID) async
  {
    Reference referenceStorage = FirebaseStorage.instance.ref()
        .child("userImages")
        .child(currentUserID)
        .child(currentUserID + ".png");

    await referenceStorage.putFile(imageFileOfUser).whenComplete((){});

    AppConstants.currentUser.displayImage = MemoryImage(imageFileOfUser.readAsBytesSync());
  }
  login(email, password) async
  {
    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      ).then((result) async
      {
        String currentUserID = result.user!.uid;
        AppConstants.currentUser.id = currentUserID;

        await getUserInfoFromFireStore(currentUserID);
      });
    }
    catch(e)
    {
      Get.snackbar("Error", e.toString());
    }
  }
  getUserInfoFromFireStore(userID) async
  {
   DocumentSnapshot snapshot = await
   FirebaseFirestore.instance.collection("user").doc(userID).get();

   AppConstants.currentUser.snapshot = snapshot;
   AppConstants.currentUser.firstName = snapshot["firstName"] ?? "";
   AppConstants.currentUser.lastName = snapshot["lastName"] ?? "";
   AppConstants.currentUser.email = snapshot["email"] ?? "";
   AppConstants.currentUser.bio = snapshot["bio"] ?? "";
   AppConstants.currentUser.city = snapshot["city"] ?? "";
   AppConstants.currentUser.country= snapshot["country"] ?? "";
   AppConstants.currentUser.isHost = snapshot["isHost"] ?? false;
  }
  getImageFromStorage(userID) async
  {
    if(AppConstants.currentUser.displayImage != null)
    {
      return AppConstants.currentUser.displayImage;
    }
    final imageDataInBytes =await FirebaseStorage.instance.ref().
    child("userImages")
        .child(userID).child(userID + ".png");
  }
}
