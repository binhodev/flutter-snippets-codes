import 'package:';

class Authentication {

    final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> resetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: 'usermail@user.com');
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  Future<void> changePassword({User user, String password}) async {
    final User userCredential = user ?? _auth.currentUser;

    await userCredential.updatePassword(password).then((_) {
      print('Sucesso ao trocar a senha');
    }).catchError((error) {
      print(error);
    });
  }

}


