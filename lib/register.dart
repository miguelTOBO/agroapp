import 'package:flutter/material.dart';
import 'package:splash/iniciar_sesion.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:splash/login/login.dart';
import 'package:splash/register2.dart';

class register extends StatefulWidget {

  @override
  State<register> createState() => _registerState();

}

class _registerState extends State<register> {
  final RegistroUsuarioLogin _authService = RegistroUsuarioLogin();
  final _formKey = GlobalKey<FormState>();
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  final _confirmPasswordController=TextEditingController();
  final _rol=TextEditingController();
  bool isCheckid=false;

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
              child:Column(
                  children: [
                    Center(
                      child:Container(
                        margin:EdgeInsets.only(top:30),
                        height: 200,
                        width: 200,
                        child: Image.asset(
                            'imagenes/logito.png',
                            fit: BoxFit.cover,
                            alignment: Alignment.center
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          height: 589,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(128, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                              topLeft:Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: Form(
                            key:_formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 20),
                                    child:Text('Registro',
                                        style:TextStyle(
                                            fontFamily: 'Barlow',
                                            color: Color.fromARGB(255, 28, 62, 44),
                                            fontSize:25,
                                            fontWeight: FontWeight.w800
                                        )
                                    )
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child:Text('Llena todos los campos de informacion',
                                        style:TextStyle(
                                            fontFamily: 'Barlow',
                                            color: Color.fromARGB(255, 28, 62, 44),
                                            fontSize:15,
                                            fontWeight: FontWeight.w800
                                        )
                                    )
                                ),
                                SizedBox(height: 15),
                                Container(
                                  height: 60,
                                  width: 300,
                                  child: TextFormField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      filled:true,
                                      fillColor: Colors.transparent,
                                      hintText: 'Correo',
                                      hintStyle: TextStyle(
                                        color:Colors.black,
                                      ),
                                      prefixIcon:Icon(Icons.email_sharp,
                                        color: Colors.black,
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black,width:2),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black,width:2 ),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'ingrese su Correo';
                                      }
                                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
                                        return ("Por favor un correo valido");
                                      }else {
                                        return null;
                                      }
                                    },
                                    onSaved: (value) {
                                      _emailController.text = value!;
                                    },
                                  ),
                                ),
                                SizedBox(height: 15),
                                Container(
                                  height: 60,
                                  width: 300,
                                  child: TextFormField(
                                    controller: _passwordController,
                                    obscureText:true,
                                    decoration: InputDecoration(
                                      filled:true,
                                      fillColor: Colors.transparent,
                                      hintText: 'Contraseña',
                                      hintStyle: TextStyle(
                                        color:Colors.black,
                                      ),
                                      prefixIcon:Icon(Icons.lock,
                                        color: Colors.black,
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black,width:2),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black,width:2 ),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty)
                                        return 'ingrese su Contraseña';
                                      if (!RegExp(r'^.{6,}$').hasMatch(value)) {
                                        return ("por favor una contraseña de 6 caracteres");
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (value) {
                                      _passwordController.text = value!;
                                    },
                                  ),
                                ),
                                SizedBox(height: 15),
                                Container(
                                  height: 60,
                                  width: 300,
                                  child: TextFormField(
                                    controller: _confirmPasswordController,
                                    obscureText:true,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      hintText: 'Confirmar contraseña',
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.lock,
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
                                      if (value!.isEmpty) {
                                        return 'Ingrese su confirmación de contraseña';
                                      }  if (!RegExp(r'^.{6,}$').hasMatch(value)) {
                                        return ("por favor una contraseña de 6 caracteres");
                                      } else if (_passwordController.text != _confirmPasswordController.text) {
                                        Fluttertoast.showToast(
                                          msg: 'Las contraseñas no coinciden',
                                          toastLength: Toast.LENGTH_LONG,
                                        );
                                      } else {
                                        Fluttertoast.showToast(
                                          msg: 'Las contraseñas coinciden',
                                          toastLength: Toast.LENGTH_LONG,
                                        );
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _confirmPasswordController.text = value!;
                                    },
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  height: 60,
                                  width: 300,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      hintText: '¿Administrador o Usuario?',
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.face,
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
                                      if (value!.isEmpty) {
                                        return 'Escribe una opción';
                                      }else {
                                        return null;
                                      }
                                    },
                                    onSaved: (value) {
                                      _rol.text = value!;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Row(
                                    children: [
                                      SizedBox(height: 20),
                                      Checkbox(
                                        value: isCheckid,
                                        activeColor: Color.fromARGB(255, 28, 62, 44),
                                        onChanged: (value){
                                          setState(() {
                                            isCheckid=value!;
                                          });
                                        },
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            isCheckid=!isCheckid;
                                          });
                                        },
                                        child:Text('Acepta terminos y condiciones',
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    height: 45,
                                    width: 300,
                                    child:ElevatedButton(onPressed: () async{
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        String? dato = await _authService.registroUsuario(
                                            _emailController.text, _passwordController.text, _confirmPasswordController.text, _rol.text
                                        );
                                          if (dato == 1) {
                                            print('nivel de seguridad debil');
                                          } else if (dato == 2) {
                                            print('email ya esta registrado');
                                          }else if (dato == 3) {
                                            print('usuario ya esta registrado');
                                          } else if (dato != null) {
                                            if(_confirmPasswordController.text!=_passwordController.text){
                                              print('no se puede iniciar registro');
                                            }else {
                                              Fluttertoast.showToast(
                                                  msg: 'usuario registrado', toastLength: Toast.LENGTH_LONG);
                                                  Navigator.pushReplacement(context,
                                                    MaterialPageRoute(builder: (context) => Regis2img(uid:dato, email: _emailController.text,)));
                                            }
                                        }
                                      }
                                    },
                                      child: Text('Continuar con el registro',
                                        style: TextStyle(
                                          color:Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                      style:TextButton.styleFrom(
                                        backgroundColor: Color.fromARGB(255, 28, 62, 44),
                                      ),
                                    )
                                ),
                                SizedBox(height: 15),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                        height: 50,
                                        width: 300,
                                        child:TextButton(onPressed: (){
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>listados()));
                                        },
                                          child: Text('Iniciar Sesion',
                                            style: TextStyle(
                                              color:Color.fromARGB(255, 28, 62, 44),
                                              fontSize: 22,
                                            ),
                                          ),
                                          style:TextButton.styleFrom(
                                              backgroundColor: Colors.transparent
                                          ),

                                        )
                                    ),
                                    Center(
                                      child:  Container(
                                        margin:EdgeInsets.only(top:25),
                                        height: 2,
                                        width: 135,
                                        color: Color.fromARGB(255, 28, 62, 44),
                                      ),
                                    )
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]
              )
          ),
        ),
      ),
    );
  }
}