import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_login/screens/login.dart';
import 'package:getx_login/screens/welcome.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth authentication = FirebaseAuth.instance;
  RxBool showSpinner = false.obs;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(authentication.currentUser);
    _user.bindStream(authentication.userChanges());
    ever(_user, _moveToPage);
  }

  _moveToPage(User? user) {
    if (user == null) {
      Get.offAll(LoginPage());
    } else {
      Get.offAll(WelcomePage(
        user: user,
      ));
    }
  }

  void logout() {
    authentication.signOut();
  }

  void login(String email, password) async {
    try {
      showSpinner.value = true;
      await authentication.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar(
        'Error',
        "UserMessage",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          'Check your email and password',
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(color: Colors.white),
        ),
      );
    } finally {
      showSpinner.value = false; // 로그인 완료 후 스피너 숨김
    }
  }

  void register(
      {required String userName,
      required String email,
      required String password}) async {
    try {
      showSpinner.value = true;

      final newUser = await authentication.createUserWithEmailAndPassword(
          email: email, password: password);

      FirebaseFirestore.instance.collection('user').doc(newUser.user!.uid).set({
        'userName': userName,
        'email': email,
      });
    } catch (e) {
      Get.snackbar(
        'Error',
        "UserMessage",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          'Registration is failed',
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(color: Colors.white),
        ),
      );
    } finally {
      showSpinner.value = false;
    }
  }
}
