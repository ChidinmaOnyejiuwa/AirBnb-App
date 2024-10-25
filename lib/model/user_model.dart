import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'contact_model.dart';

class UserModel extends ContactModel
{
  String? email;
  String? password;
  String? bio;
  String? city;
  String? country;
  bool? isHost;
  bool? isCurrentlyHosting;
  DocumentSnapshot? snapshot;

  UserModel({
    String id = "",
    String firstName = "",
    String lastName = "",
    MemoryImage? displayImage,

  this.email ="",
  this.bio ="",
  this.city ="",
  this. country ="",
  }): super (
    id: id,
    firstName: firstName,
    lastName: lastName,
    displayImage: displayImage,)
  {
    isHost = false;
    isCurrentlyHosting = false;
  }
  Future<void> saveUserToFirestore() async
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
}