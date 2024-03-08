import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAvuyW1bM9ygy1L4T3MpkLOrsI8VIsHGmY",
            authDomain: "aiteach-30046.firebaseapp.com",
            projectId: "aiteach-30046",
            storageBucket: "aiteach-30046.appspot.com",
            messagingSenderId: "388023586327",
            appId: "1:388023586327:web:e12157a549c52c6a4fd652",
            measurementId: "G-CN48M8X9WT"));
  } else {
    await Firebase.initializeApp();
  }
}
