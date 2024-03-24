import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDCTvi6VAljPN_qgKG1yhJbwsYbM2_EGwE",
            authDomain: "summi-shelf-z6nbpi.firebaseapp.com",
            projectId: "summi-shelf-z6nbpi",
            storageBucket: "summi-shelf-z6nbpi.appspot.com",
            messagingSenderId: "1061902500859",
            appId: "1:1061902500859:web:a2a57b0b85958e87dd415e"));
  } else {
    await Firebase.initializeApp();
  }
}
