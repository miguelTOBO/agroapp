import 'package:flutter/material.dart';
import 'dart:io' as io;


class Publicar extends StatefulWidget {
  const Publicar({super.key});

  @override
  State<Publicar> createState() => _PublicarState();
}

class _PublicarState extends State<Publicar> {
  final frm=GlobalKey<FormState>();
  late io.File? imagen;
  late String _genero;
  late String _nombre;
  late String _sangre;
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
      body: Padding(
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
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText:'Titulo o Nombre'
                ),
                validator: (value){
                  if(value!.isEmpty)
                    return'ingrese un titulo o nombre';
                },
                onSaved: (value){
                  _genero=value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText:'Descripcion'
                ),
                validator: (value){
                  if(value!.isEmpty)
                    return'ingrese una Descripcion';
                },
                onSaved: (value){
                  _nombre=value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText:'Precio'
                ),
                validator: (value){
                  if(value!.isEmpty)
                    return'ingrese el precio ';
                },
                onSaved: (value){
                  _sangre=value!;
                },
              ),
              ElevatedButton(
                  onPressed: (){},
                  child: Text('seleccionar imagen')),
              ElevatedButton(
                  onPressed: (){
                    if(frm.currentState!.validate()){
                      frm.currentState!.save();
                      //guardar();
                    }
                  },
                  child: Text('Publicar'))
            ],
          ),
        ),
      ),
    );
  }
}
