import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/models/user.dart';
import 'package:wickwood/screens/main_screen.dart';
import 'package:wickwood/widgets/login_registration/logo.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
final userRef = FirebaseFirestore.instance.collection('users');
final productRef = FirebaseFirestore.instance.collection('products');
final idRef = FirebaseFirestore.instance.collection('ID');
final StorageReference storageRef = FirebaseStorage.instance.ref();
User currentUser;
final DateTime timestamp = DateTime.now();

class StartScreen extends StatefulWidget {
  static const String id = 'start_screen';

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  handleSignIn(GoogleSignInAccount account) {
    if (account != null) {
      createUserInFirestore();
    }
  }

  createUserInFirestore() async {
    final GoogleSignInAccount user = googleSignIn.currentUser;
    DocumentSnapshot userdoc = await userRef.doc(user.id).get();

    if (!userdoc.exists) {
      userRef.doc(user.id).set({
        'id': user.id,
        'email': user.email,
        'photo_url': user.photoUrl,
        'display_name': user.displayName,
        'time_stamp': timestamp,
      });

      userdoc = await userRef.doc(user.id).get();
    }
    currentUser = User.fromDocument(userdoc);
    Navigator.pushNamed(context, MainScreen.id);
  }

  @override
  void initState() {
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((accout) {
      handleSignIn(accout);
    }, onError: (e) {
      print(e);
    });

    googleSignIn.signInSilently(suppressErrors: false).then((account) {
      handleSignIn(account);
    }, onError: (e) {
      print(e);
    });
  }

  login() {
    googleSignIn.signIn();
  }

  logout() {
    googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrownBGColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Logo(
              height: 100,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 120),
              child: Image.asset('assets/images/startscreenimage.png'),
            ),
            GestureDetector(
              onTap: login,
              child: Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/google_signin_button.png'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
