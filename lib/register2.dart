import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class regis2img extends StatefulWidget{
  /*const Formulariopublicacion({super.key});*/

  @override
  State<regis2img> createState() => _regis2imgState();
}

class _regis2imgState extends State<regis2img>{

  final String defaultimg='img/';
  late io.File? imagen=io.File('img/');
  final picker=ImagePicker();
  final _formKey=GlobalKey<FormState>();

  Future<void> obtenerimagen()async{
    final imgurl=await picker.pickImage(source: ImageSource.gallery);
    if(imgurl != null){
      setState(() {
        imagen=io.File(imgurl!.path);
      });
    }
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
                ElevatedButton(onPressed: () {
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
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
