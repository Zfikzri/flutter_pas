import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethod {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      if (email.isEmpty || password.isEmpty || name.isEmpty) {
        return "All fields must be filled";
      } else {

        UserCredential cred =
        await auth.createUserWithEmailAndPassword(email: email, password: password);

        await firestore.collection("users").doc(cred.user!.uid).set({
          'name': name,
          'password': password,
          'email': email,
        });

        return "Success";

      }
    } catch (err) {
      return err.toString();
    }
  }
}