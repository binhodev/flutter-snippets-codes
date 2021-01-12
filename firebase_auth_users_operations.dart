import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Criando um usuário com email e senha
  Future<void> createUser() async {
    try {
      final UserCredential userCredential = 
        await _auth.createUserWithEmailAndPassword(email: 'usermail@user.com', password: '12345678');
      print('New user id: ${userCredential.user.uid}');

      //Se deseja carregar as informações do usuário...
      //logo após a criação da conta.
      loadingCurrentUser();
    } on FirebaseAuthException catch (e) {
      print(e.code); // Preferencial o uso do debugPrint.
    }
  }

  //Carregando o usuário atual
  Future<void> loadingCurrentUser({User user}) async {
    final User userCredential = user ?? _auth.currentUser;
    if (userCredential != null) {
      //Você pode inserir outras funções aqui, por exemplo...
      //carregar informações do perfil do usuário que acabou de entrar.
    }
    print('Usuário atual logado: ${userCredential?.email ?? 'Nenhum usuário logado'}');
  }

  //Redefinição da senha do usuário
  Future<void> resetUserPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: 'usermail@user.com');
    } on FirebaseAuthException catch (e) {
      print(e.code); // Preferencial o uso do debugPrint.
    }
  }

  //Alterando a senha do usuário
  Future<void> changeUserPassword({User user, String password}) async {
    final User userCredential = user ?? _auth.currentUser;

    await userCredential.updatePassword(password).then((_) {
      print('Sucesso ao trocar a senha');
    }).catchError((error) {
      print(error); // Preferencial o uso do debugPrint.
    });
  }

}


