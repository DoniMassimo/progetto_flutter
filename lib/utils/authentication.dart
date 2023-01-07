
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
CollectionReference users = FirebaseFirestore.instance.collection('Users');
String? uid;
String? userEmail;

final GoogleSignIn googleSignIn = GoogleSignIn();

String? name;


Future<User?> signInWithGoogle() async {
  // Initialize Firebase
  await Firebase.initializeApp();
  User? user;

  // The `GoogleAuthProvider` can only be used while running on the web 
  GoogleAuthProvider authProvider = GoogleAuthProvider();

  try {
    final UserCredential userCredential =
        await _auth.signInWithPopup(authProvider);

    user = userCredential.user;
  } catch (e) {
    print(e);
  }
  
  if (user != null) {
    uid = user.uid;
    name = user.displayName;
    userEmail = user.email;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('auth', true);


    final list = await _auth.fetchSignInMethodsForEmail(userEmail!);
    

    if (list.isEmpty) {
  

      await users.add({
        "name": name,
        "email": userEmail,
        "score": 0,
     });
    }
      var giorgio;
      final snapshot = users.where("email", isEqualTo:userEmail).snapshots().map<String>((event) => 'Square: ${event.toString()}');
      

      

  
  }
    return user;

  }
  


void signOutGoogle() async {
  await googleSignIn.signOut();
  await _auth.signOut();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('auth', false);

  uid = null;
  name = null;
  userEmail = null;
  

}

