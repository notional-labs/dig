import 'package:firebase_core/firebase_core.dart';

Future<FirebaseApp> initFirebase() {
  return Firebase.initializeApp();
}
