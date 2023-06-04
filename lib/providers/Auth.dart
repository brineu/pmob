

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';


class AuthService with ChangeNotifier{
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  UserDetail? _userFromFirebase(auth.User? user){
    if (user == null){
      return null;
    }
    return UserDetail(user.uid, user.email, user.displayName, user.photoURL);
  }

  Stream<UserDetail?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<UserDetail?> signInWithEmailAndPassword(String Email, String password) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(email: Email, password: password);

    return _userFromFirebase(credential.user);
  }

  Future<UserDetail?> createUserWithEmailAndPassword(String Email, String password, String name, String img) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(email: Email, password: password);

    return _userFromFirebase(credential.user);
  }

  Future<void> signOut () async {
    return await _firebaseAuth.signOut();
  }
   Future<UserDetail?> updateUserData(
      String displayName,String Photo) async {
    await FirebaseAuth.instance.currentUser!.updateDisplayName(displayName);
    await FirebaseAuth.instance.currentUser!.updatePhotoURL(Photo);
    await FirebaseAuth.instance.currentUser!.reload();
        notifyListeners();
    return null;
  }
  Future<UserDetail?> updateUserDataAll(
      String displayName,String Photo, String email, String password) async {
    await FirebaseAuth.instance.currentUser!.updateEmail(email);
    await FirebaseAuth.instance.currentUser!.updatePassword(password);
    await FirebaseAuth.instance.currentUser!.updateDisplayName(displayName);
    await FirebaseAuth.instance.currentUser!.updatePhotoURL(Photo);
    await FirebaseAuth.instance.currentUser!.reload();
        notifyListeners();
    return null;
  }
  Future<UserDetail?> DeleteAcc() async {
    await FirebaseAuth.instance.currentUser!.delete();
        notifyListeners();
    return null;
  }
}