import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:splash/iniciar_sesion.dart';
import 'package:splash/register.dart';


class Regis2img extends StatefulWidget{
  final String uid;
  final String email;

  Regis2img({required this.uid, required this.email});
  @override
  State<Regis2img> createState() => _Regis2imgState();
}

class _Regis2imgState extends State<Regis2img>{
  register mial= register();
  late io.File? imagen=null;
  final TextEditingController _nombre=TextEditingController();
  final TextEditingController _descripcion=TextEditingController();
  final TextEditingController _lugar=TextEditingController();
  final picker=ImagePicker();
  final _formKey=GlobalKey<FormState>();
  late String uid='';

  void initState() {
    super.initState();
  }

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
        backgroundColor: Color.fromARGB(255, 28, 62, 44),
        title: Text('Registrar datos',
          style: TextStyle(
              color: Colors.white,
            fontWeight: FontWeight.w500
          ),
        ),
        iconTheme: IconThemeData(
            color: Colors.transparent
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 50,),
                Center(
                  child: imagen != null
                      ? Image.file(imagen!)
                      : Icon(Icons.person, size: 150, color: Colors.grey),
                ),
                ElevatedButton(
                    onPressed: obtenerimagen,
                    child: Text('Seleccionar',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    style:TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 28, 62, 44),),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    controller: _nombre,
                    decoration: InputDecoration(
                        hintText:'nombre usuario'
                    ),
                    validator: (value){
                      if(value!.isEmpty)
                        return'ingrese un nombre';
                    },
                    onSaved: (value){
                      _nombre.text=value!;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    controller: _descripcion,
                    decoration: InputDecoration(
                        hintText:'Descripcion'
                    ),
                    validator: (value){
                      if(value!.isEmpty)
                        return'ingrese una Descripcion';
                    },
                    onSaved: (value){
                      _descripcion.text=value!;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    controller: _lugar,
                    decoration: InputDecoration(
                        hintText:'Lugar'
                    ),
                    validator: (value){
                      if(value!.isEmpty)
                        return'ingrese una Descripcion';
                    },
                    onSaved: (value){
                      _lugar.text=value!;
                    },
                  ),
                ),
                Container(
                    height: 45,
                    width: 250,
                    margin: EdgeInsets.all(15),
                    child:ElevatedButton(onPressed: () async{
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        guardarimg();
                        Fluttertoast.showToast(msg: 'usuario registrado',
                            toastLength: Toast.LENGTH_LONG);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(
                                builder: (context) => listados()));
                      }
                    },
                      child: Text('Terminar el registro',
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: 17,
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
    Reference ref=storage.ref().child('imagenes_perfil/${DateTime.now(). toString()}');
    UploadTask uploadTask=ref.putFile(imagen!);
    TaskSnapshot snapshot=await uploadTask.whenComplete(()=>null);
    String img = await snapshot.ref.getDownloadURL();
    FirebaseAuth auth = FirebaseAuth.instance;
    User? currentUser = auth.currentUser;
    FirebaseFirestore.instance.collection('usuario').doc(widget.uid).update({
      'nombre': _nombre.text,
      'descripcion': _descripcion.text,
      'foto':img,
      'lugar':_lugar.text,
      'uid':widget.uid,
      'email':widget.email
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





