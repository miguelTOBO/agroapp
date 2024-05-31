import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:splash/iniciar_sesion.dart';
import 'package:splash/register.dart';

import 'login/login.dart';

class regis2img extends StatefulWidget{
  /*const Formulariopublicacion({super.key});*/

  @override
  State<regis2img> createState() => _regis2imgState();
}

class _regis2imgState extends State<regis2img>{
  register mial= register();
  final String defaultimg='img/';
  late io.File? imagen=io.File('img/');
  final picker=ImagePicker();
  final _formKey=GlobalKey<FormState>();
  /*late io.File? imagen_updated;*/

  Future<void> obtenerimagen()async{
    final imgurl=await picker.pickImage(source: ImageSource.gallery);
    if(imgurl != null){
      setState(() {
        imagen=io.File(imgurl!.path);
      });
    }
  }
  Future<XFile?> imageeen()async{
    final ImagePicker _picker=ImagePicker();
    final XFile? image=await _picker.pickImage(source: ImageSource.camera);
    return image;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar datos'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: imagen !=null?
                  Image.file(imagen!) :
                  Image.asset(('img/color.jpeg'), height: 100,),
                ),
                ElevatedButton(
                    onPressed: obtenerimagen, child: Text('Seleccionar')
                ),
                /*imagen_updated !=null?Image.file(imagen_updated!):Container(
                  margin: const EdgeInsets.all(15),
                  height: 200,
                  width: 275,
                  child:  ElevatedButton(
                    onPressed: ()async{
                      final imagen=await imageeen();
                      setState(() {
                        imagen_updated=File(imagen!.path);
                      });
                    },
                    child: Icon(Icons.add_box_outlined,
                      color: Colors.white,
                      size: 80,
                    ),
                    style:ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      backgroundColor: Color.fromARGB(125, 71, 142, 59),
                    ),
                  ),
                ),*/
                ElevatedButton(onPressed: () {
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                    /*var dato = mial.register(
                        _emailController as String, _passwordController as String, _confirmPasswordController as String, _rol as String);
                    Fluttertoast.showToast(msg: 'dato $dato',
                        toastLength: Toast.LENGTH_LONG
                    );
                    if (dato == 1) {
                      print('nivel de seguridad debil');
                    } else if (dato == 2) {
                      print('email ya esta registrado');
                    }else if (dato == 3) {
                      print('usuario ya esta registrado');
                    } else if (dato != null) {*/
                      Fluttertoast.showToast(msg: 'trendras que poner tu foto de perfil algun dia!!',
                          toastLength: Toast.LENGTH_LONG);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context)=> listados()));
                    guardarimg();
                  }
                },
                  child: Text('Subir foto de perfil',
                    style: TextStyle(
                      color:Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  style:TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 28, 62, 44),
                  ),
                ),
                Container(
                    height: 45,
                    width: 300,
                    child:ElevatedButton(onPressed: () async{
                      Fluttertoast.showToast(msg: 'usuario registrado',
                          toastLength: Toast.LENGTH_LONG);
                            Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context)=> listados()));
                      },
                      child: Text('Terminar el registro',
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
                Container(
                    height: 45,
                    width: 300,
                    child:ElevatedButton(onPressed: () async{
                      Fluttertoast.showToast(msg: 'trendras que poner tu foto de perfil algun dia!!',
                          toastLength: Toast.LENGTH_LONG);
                            Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context)=> listados()));
                    },
                      child: Text('omitir',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
  void guardarimg() async{
    FirebaseStorage storage =FirebaseStorage.instance;
    Reference ref=storage.ref().child('imagenes/${DateTime.now(). toString()}');
    UploadTask uploadTask=ref.putFile(imagen!);
    TaskSnapshot snapshot=await uploadTask.whenComplete(() => ()=>null);
    String img = await snapshot.ref.getDownloadURL();
    /*UploadTask loadTask=ref.putFile(imagen_updated!);
    TaskSnapshot snapsh=await loadTask.whenComplete(() => ()=>null);
    String imge = await snapsh.ref.getDownloadURL();*/
    FirebaseFirestore.instance.collection('usuario').add({
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
}
