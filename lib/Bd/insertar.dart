/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Formulariopublicacion extends StatefulWidget{
  /*const Formulariopublicacion({super.key});*/
  /*final Insertardatos insertardatos=insertardatos();*/

  @override
  State<Formulariopublicacion> createState() => _FormulariopublicacionState();
}

class _FormulariopublicacionState extends State<Formulariopublicacion>{

  final String defaultimg='img/';
  late io.File? imagen=io.File('img/');
  final picker=ImagePicker();
  final frm=GlobalKey<FormState>();
  late String _documento;
  late String _nombre;

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
            key: frm,
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
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Documento',
                  ),
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return 'Ingresar documento';
                    } else{
                      return null;
                    }
                  },
                  onSaved: (value){
                    _documento=value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'nombre',
                  ),
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return 'Ingresar nombre';
                    } else{
                      return null;
                    }
                  },
                  onSaved: (value){
                    _nombre=value!;
                  },
                ),
                ElevatedButton(onPressed: () {
                  if(frm.currentState!.validate()){
                    frm.currentState!.save();
                    guardardatos();
                  }
                },
                    child: Text('guardar')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void guardardatos() async{
    FirebaseStorage storage =FirebaseStorage.instance;
    Reference ref=storage.ref().child('imagenes/${DateTime.now(). toString()}');
    UploadTask uploadTask=ref.putFile(imagen!);
    TaskSnapshot snapshot=await uploadTask.whenComplete(() => ()=>null);
    String img = await snapshot.ref.getDownloadURL();
    FirebaseFirestore.instance.collection('cliente').add({
      'documento': _documento,
      'nombre': _nombre
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
*/