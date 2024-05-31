import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistroUsuarioLogin{
  final FirebaseAuth _fa =FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future registroUsuario(String correo, String password, String conpassword, String rol)async{
    try{
      UserCredential uc=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: correo, password: password);
      print(uc.user);
      User? user = uc.user;

      if (user != null) {
        await _firestore.collection('usuario').doc(user.uid).set({
          'email': correo,
          'uid': user.uid,
        });
        return user.uid;
      }
      return(uc.user?.uid);
    }on FirebaseAuthException catch(e){
      if(e.code=='weak-password'){
        print('el password');
        return 1;
      }else if (e.code=='email-already--in-use'){
        print('ya existe');
        return 2;
      }else if (e.code=='user-already--in-use'){
        print('ya existe');
        return 3;
      }
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
        if(e.code=='user-not-found'||e.code=='password-not-found'){
          return 1;
        }else if (e.code=='wrong-user'||e.code=='wrong-password'){
          return 2;
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