import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:splash/principal.dart';
import 'package:splash/register.dart';
import 'package:splash/login/login.dart';
import 'package:flutter/services.dart';

class listados extends StatefulWidget {

  @override
  State<listados> createState() => _listadosState();
}

class _listadosState extends State<listados> {
  RegistroUsuarioLogin mial = RegistroUsuarioLogin();
  final formKey=GlobalKey<FormState>();
  late String _emailController;
  late String _passwordController;
  bool isCheckid=false;
  final LocalAuthentication _auth=LocalAuthentication();
  late LocalAuthentication _localAth;
  bool _isBiometric=false;
  bool _finger=false;
  bool _authfinger=false;
  @override
  void initState(){
    super.initState();
    _checkBiometric();
    _listBioAndFingerType();
  }
  Widget build(BuildContext context) {
    //final size=MediaQuery.of(context).size;

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
                          margin:EdgeInsets.only(top:50),
                          height: 230,
                          width: 230,
                          child: Image.asset(
                              'imagenes/logito.png',
                              fit: BoxFit.cover,
                              alignment: Alignment.center
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                      ),
                      Padding(
                        padding: EdgeInsets.all(1.0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            height: 510,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(128, 255, 255, 255),
                              borderRadius: BorderRadius.only(
                                topLeft:Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                            ),
                            child: Form(
                              key:formKey,
                              child:
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child:Text('Iniciar Sesion',
                                          style:TextStyle(
                                              fontFamily: 'Barlow',
                                              color: Color.fromARGB(255, 28, 62, 44),
                                              fontSize:25,
                                              fontWeight: FontWeight.w800
                                          )
                                      )
                                  ),
                                  SizedBox(height: 20,),
                                  Container(
                                    height: 60,
                                    width: 300,
                                    child:TextFormField(
                                      controller: null,
                                      decoration: InputDecoration(
                                        filled:true,
                                        fillColor: Colors.transparent,
                                        hintText:'Usuario o correo',
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
                                      validator: (value){
                                        if(value==null || value.isEmpty){
                                          return 'Ingresar Usuario o correo';
                                        } else{
                                          return null;
                                        }
                                      },
                                      onSaved: (value){
                                        _emailController=value!;
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 20,),
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
                                      validator: (value){
                                        if(value==null || value.isEmpty){
                                          return 'Ingresar contraseña';
                                        } else{
                                          return null;
                                        }
                                      },
                                      onSaved: (value){
                                        _passwordController=value!;
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 40,),
                                  Container(
                                      height: 50,
                                      width: 300,
                                      child:ElevatedButton(onPressed: () async {
                                        if(formKey.currentState!.validate()){
                                          formKey.currentState!.save();
                                          var dato = mial.LoginUsuario(
                                              _emailController, _passwordController /*_usuaController, _numeroController*/);
                                          if (dato == 1) {
                                            Fluttertoast.showToast(msg: 'usuario o contraseña no encontrados',
                                                toastLength: Toast.LENGTH_LONG
                                            );
                                          }if (dato == 2) {
                                            Fluttertoast.showToast(msg: 'usuario o contraseña incorrecta',
                                                toastLength: Toast.LENGTH_LONG
                                            );
                                          } else if (dato != null) {
                                            /*bool auth = await Autenticacion.authentication();*/
                                            Fluttertoast.showToast(msg: 'Inicio de sesion exitoso',
                                                toastLength: Toast.LENGTH_LONG
                                            );
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => principal())
                                            );
                                          }
                                        }
                                      },
                                        child: Text('Iniciar Sesión',
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
                                  Padding(
                                    padding: EdgeInsets.all(1),
                                    child: Text('¿No tienes cuenta?',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          height: 44,
                                          width: 300,
                                          child:TextButton(onPressed: (){
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>register()));
                                          },
                                            child: Text('Registrarse',
                                              style: TextStyle(
                                                  color:Color.fromARGB(255, 28, 62, 44),
                                                  fontSize: 22,
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
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: iniciarAuth,
                                      icon: Icon(Icons.fingerprint),
                                      iconSize:30
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      )
                    ]
                )
            ),
        ),
      ),
    );
  }

  void guardardatos() async{
    FirebaseFirestore.instance.collection('vendedor').add({
      'correo': _emailController,
      'contraseña': _passwordController
    }).then((value){
      Fluttertoast.showToast(
        msg: 'los datos guardados.',
        gravity: ToastGravity.CENTER,
      );
    }).catchError((error){
      Fluttertoast.showToast(
        msg: 'Los datos no se guardaron.',
        gravity: ToastGravity.CENTER,
      );
    });
  }

  void _checkBiometric()async{
    try{
      final bio=await _auth.canCheckBiometrics;
      setState(() {
        _isBiometric=bio;
      });
      print('Biometrics= $_isBiometric');
    }catch(e){}
  }

  void _listBioAndFingerType()async{
    late List<BiometricType>_listType;
    try{
      _listType = await _auth.getAvailableBiometrics();
    }on PlatformException catch(e){
      print(e.message);
    }
    print('lista biometrica $_listType');
    if(_listType.contains(BiometricType.fingerprint)){
      setState(() {
        _finger=true;
      });
      print('el dedo es $_finger');
    }
  }

  void iniciarAuth()async{
    try {
      _authfinger = await _auth.authenticate(
        localizedReason: 'Escanea tu huella',
        options: const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (e) {
      print(e.message);
    }
    if (_authfinger) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => principal()));
    }
  }
}