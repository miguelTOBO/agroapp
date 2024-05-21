import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splash/iniciar_sesion.dart';
import 'package:splash/principal.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:splash/login/login.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  RegistroUsuarioLogin mial = RegistroUsuarioLogin();
  @override
  final frm = GlobalKey<FormState>();
  /*late String _usuaController;
  late String _numeroController;*/
  late String _emailController;
  late String _passwordController;
  bool isCheckid=false;

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
                          key:null,
                          child:
                          Column(
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
                              /*Container(
                                height: 60,
                                width: 300,
                                child:TextFormField(
                                  controller: null,
                                  decoration: InputDecoration(
                                    filled:true,
                                    fillColor: Colors.transparent,
                                    hintText:'Usuario',
                                    hintStyle:TextStyle(
                                      color:Colors.black,
                                    ),
                                    prefixIcon:Icon(Icons.person,
                                      color:Colors.black,
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
                                      return 'ingrese su Usuario';
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _usuaController = value!;
                                  },
                                ),
                              ),*/
                              SizedBox(height: 15),
                              Container(
                                height: 60,
                                width: 300,
                                child: TextFormField(
                                  controller: null,
                                  obscureText:true,
                                  decoration: InputDecoration(
                                    filled:true,
                                    fillColor: Colors.transparent,
                                    hintText: 'Correo',
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
                                      return 'ingrese su Correo';
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _emailController = value!;
                                  },
                                ),
                              ),
                              SizedBox(height: 15),
                              /*Container(
                                height: 60,
                                width: 300,
                                child: TextFormField(
                                  controller: null,
                                  obscureText:true,
                                  decoration: InputDecoration(
                                    filled:true,
                                    fillColor: Colors.transparent,
                                    hintText: 'Numero',
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
                                      return 'ingrese su Numero';
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _numeroController = value!;
                                  },
                                ),
                              ),*/
                              SizedBox(height: 15),
                              Container(
                                height: 60,
                                width: 300,
                                child: TextFormField(
                                  controller: null,
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
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _passwordController = value!;
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
                                  child:TextButton(onPressed: () async{
                                    if (frm.currentState!.validate()) {
                                      frm.currentState!.save();
                                      var dato = mial.registroUsuario(
                                          _emailController, _passwordController /*_usuaController, _numeroController*/);
                                      if (dato == 1) {
                                        Fluttertoast.showToast(msg: 'nivel de seguridad debil',
                                            toastLength: Toast.LENGTH_LONG
                                        );
                                      } else if (dato == 2) {
                                        Fluttertoast.showToast(msg: 'email ya esta registrado',
                                            toastLength: Toast.LENGTH_LONG
                                        );
                                      }/*else if (dato == 3) {
                                        Fluttertoast.showToast(msg: 'usuario ya esta registrado',
                                            toastLength: Toast.LENGTH_LONG
                                        );
                                      }*/ else if (dato != null) {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context)=> principal())
                                        );
                                        Fluttertoast.showToast(msg: 'usuario registrado',
                                            toastLength: Toast.LENGTH_LONG
                                        );
                                      }
                                    }
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
                    )


                  ]
              )
          ),
        ),
      ),
    );
  }
}
