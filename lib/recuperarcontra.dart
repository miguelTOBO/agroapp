import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:splash/iniciar_sesion.dart';
import 'package:splash/register.dart';
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
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
           image: AssetImage('imagenes/fondoo.jpg'),
           fit: BoxFit.cover
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                ),
                Padding(
                 padding: EdgeInsets.all(1.0),
                  child: Container(
                    width: double.infinity,
                    height: 710,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(128, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                        topLeft:Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 20),
                              child:Text('Recuperación de contraseña',
                                  style:TextStyle(
                                      fontFamily: 'Barlow',
                                      color: Color.fromARGB(255, 28, 62, 44),
                                      fontSize:25,
                                      fontWeight: FontWeight.w800
                                  )
                              )
                          ),
                          Container(
                            height: 60,
                            width: 400,
                            child:TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                filled:true,
                                fillColor: Colors.transparent,
                                hintText:'Correo',
                                hintStyle:TextStyle(
                                  color:Colors.black,
                                ),
                                prefixIcon:Icon(Icons.email_sharp,
                                  color:Colors.black,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black,width:2),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black,width:2 ),
                                ),
                              ),
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  return 'Ingresar correo registrado';
                                } else{
                                  return null;
                                }
                              },
                              onSaved: (value){
                                _emailController.text =value!;
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _enviarcorreo(_emailController.text);
                              }
                            },
                            child: Text('Enviar correo de recuperación',
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            style:TextButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 28, 62, 44),
                            ),
                          ),
                          Column(
                              children: [
                                Container(
                                    height: 44,
                                    width: 300,
                                    child:TextButton(onPressed: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>listados()));
                                    },
                                      child: Text('Iniciar sesion',
                                        style: TextStyle(
                                            color:Color.fromARGB(255, 28, 62, 44),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      style:TextButton.styleFrom(
                                          backgroundColor: Colors.transparent
                                      ),
                                    )
                                ),
                                Center(
                                  child: Container(
                                    height: 2,
                                    width: 112,
                                    color: Color.fromARGB(255, 28, 62, 44),
                                  ),
                                ),
                              ]
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>register()));
                            },
                            child: Text('Registrarse',
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            style:TextButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 28, 62, 44),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  var acs = ActionCodeSettings(
      url: 'https://agroapp-d94c0.web.app',
      handleCodeInApp: true,
      androidPackageName: 'com.example.splash.android',
      androidInstallApp: true,
      androidMinimumVersion: '15'
  );

  void _enviarcorreo(String correo) async {
    try {
      var emailAuth;
      await FirebaseAuth.instance.sendSignInLinkToEmail(email: emailAuth, actionCodeSettings: acs);
      Fluttertoast.showToast(
        msg: 'Se ha enviado un correo electrónico de recuperación a $correo',
        toastLength: Toast.LENGTH_LONG,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Error al enviar el correo electrónico de recuperación: $e',
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
