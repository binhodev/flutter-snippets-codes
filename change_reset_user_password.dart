import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createUser() async {
    try {
      final UserCredential userCredential = 
        await _auth.createUserWithEmailAndPassword(email: 'usermail@user.com', password: '12345678');
      print('New user id: ${userCredential.user.uid}');
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  Future<void> resetUserPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: 'usermail@user.com');
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  Future<void> changeUserPassword({User user, String password}) async {
    final User userCredential = user ?? _auth.currentUser;

    await userCredential.updatePassword(password).then((_) {
      print('Sucesso ao trocar a senha');
    }).catchError((error) {
      print(error);
    });
  }

}


