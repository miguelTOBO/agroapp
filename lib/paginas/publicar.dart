import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:flutter/widgets.dart';


class Publicar extends StatefulWidget {
  //const Publicar({super.key});

  @override
  State<Publicar> createState() => _PublicarState();
}

Future<XFile?> imageeen()async{
  final ImagePicker _picker=ImagePicker();
  final XFile? image=await _picker.pickImage(source: ImageSource.camera);
  return image;
}
class _PublicarState extends State<Publicar> {
  File? imagen_updated;
  final frm=GlobalKey<FormState>();
  late String _titulo;
  late String _descripcion;
  late String _precio;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 28, 62, 44),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'AGRO',
              style: TextStyle(
                fontFamily: 'Barlow',
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            Text(
              'APP',
              style: TextStyle(
                fontFamily: 'Barlow',
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: Color.fromARGB(255, 255, 201, 25),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Form(
            key: frm,
            child: Column(
              children: [

                Padding(
                  padding: EdgeInsets.all(5),
                  child:Center(
                    child: Text(
                      'Nueva publicacion',
                      style: TextStyle(
                        fontFamily: 'Barlow',
                        fontWeight: FontWeight.w700,
                        fontSize: 35,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child:Center(
                    child: Text(
                      'Llena todos los campos de informacion',
                      style: TextStyle(
                        fontFamily: 'Barlow',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child:TextFormField(
                    decoration: InputDecoration(
                        hintText:'Titulo o Nombre'
                    ),
                    validator: (value){
                      if(value!.isEmpty)
                        return'ingrese un titulo o nombre';
                    },
                    onSaved: (value){
                      _titulo=value!;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText:'Descripcion'
                    ),
                    validator: (value){
                      if(value!.isEmpty)
                        return'ingrese una Descripcion';
                    },
                    onSaved: (value){
                      _descripcion=value!;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText:'Precio'
                    ),
                    validator: (value){
                      if(value!.isEmpty)
                        return'ingrese el precio ';
                    },
                    onSaved: (value){
                      _precio=value!;
                    },
                  ),
                ),
                imagen_updated !=null?Image.file(imagen_updated!):Container(
                  margin: EdgeInsets.all(15),
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
                ),

                Container(
                    margin: EdgeInsets.all(10),
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: (){
                        if(frm.currentState!.validate()){
                          frm.currentState!.save();
                          //guardar();
                        }
                      },
                      child: Text('Publicar',
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      style:TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 28, 62, 44),
                      ),
                    )
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
