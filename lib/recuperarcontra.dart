import 'package:flutter/material.dart';
import 'package:splash/iniciar_sesion.dart';
import 'package:firebase_auth/firebase_auth.dart';

class recuperarcon extends StatefulWidget {
  @override
  _recuperarconState createState() => _recuperarconState();
}

class _recuperarconState extends State<recuperarcon> {
  final _formKey = GlobalKey<FormState>();
  var _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('imagenes/fondoo.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body:SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child:Container(
                    margin:EdgeInsets.all(30),
                    height: 200,
                    width: 200,
                    child: Image.asset('imagenes/logito.png',
                      fit: BoxFit.cover,
                      alignment: Alignment.center
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 560,
                decoration: BoxDecoration(
                  color: Color.fromARGB(128, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child:Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'Recuperación de contraseña',
                              style: TextStyle(
                                fontFamily: 'Barlow',
                                color: Color.fromARGB(255, 28, 62, 44),
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 300,
                            child: TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent,
                                hintText: 'Correo',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                prefixIcon: Icon(
                                  Icons.email_sharp,
                                  color: Colors.black,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: 2),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: 2),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Ingresar correo registrado';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                recuperarContrasena(_emailController.text);
                              }
                            },
                            child: Text(
                              'Enviar correo de recuperación',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 28, 62, 44),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                height: 44,
                                width: 300,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => listados()));
                                  },
                                  child: Text(
                                    'Iniciar sesión',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 28, 62, 44),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  height: 2,
                                  width: 112,
                                  color: Color.fromARGB(255, 28, 62, 44),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }

  Future<void> recuperarContrasena(String _emailController) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.sendPasswordResetEmail(email: _emailController);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Se ha enviado un correo electrónico para restablecer la contraseña.'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-not-found') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('No se encontró ninguna cuenta con ese correo electrónico.'),
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Ocurrió un error al enviar el correo electrónico de restablecimiento: ${e.message}'),
            );
          },
        );
      }
    }
  }

}
