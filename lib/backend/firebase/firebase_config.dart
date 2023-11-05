import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDw9hWb2L0olMlhBlxpXY_Lrbl07IKKzRg",
            authDomain: "trials-v2.firebaseapp.com",
            projectId: "trials-v2",
            storageBucket: "trials-v2.appspot.com",
            messagingSenderId: "645367206431",
            appId: "1:645367206431:web:57fbc356c53d0826f17b2a"));
  } else {
    await Firebase.initializeApp();
  }
}
