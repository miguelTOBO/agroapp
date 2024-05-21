import 'package:firebase_auth/firebase_auth.dart';

class RegistroUsuarioLogin{
  final FirebaseAuth _fa =FirebaseAuth.instance;

  Future registroUsuario(String correo, String password,/* String usuario, String numero*/)async{
    try{
      UserCredential uc=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: correo, password: password);
      print(uc.user);
      return(uc.user?.uid);
    }on FirebaseAuthException catch(e){
      if(e.code=='weak-password'){
        print('el password');
        return 1;
      }else if (e.code=='email-already--in-use'){
        print('ya existe');
        return 2;
      }/*else if (e.code=='usuario-already--in-use'){
        print('ya existe');
        return 3;
      }*/
    }
  }
  Future LoginUsuario(String correo, String password)async{
    if(correo.isNotEmpty && password.isNotEmpty){
      try{
        UserCredential uc=await _fa.signInWithEmailAndPassword(email: correo, password: password);
        final y=uc.user;
        if(y!=null){
          return true;
        }
      }on FirebaseAuthException catch(e){
        print('Error de autenticacion: ${e.code}');
        if(e.code=='user-not-found'||e.code=='wrong-password'){
          return false;
        }
      }catch(e){
        print('error: $e');
      }
    }else{
      print('no pueden ir vacio estos campos');
      return false;
    }
  }
}