import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
class Actualizar extends StatefulWidget {
  final Map<String, dynamic> usuario;

  Actualizar({required this.usuario});

  @override
  State<Actualizar> createState() => _ActualizarState();
}

class _ActualizarState extends State<Actualizar> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descripController = TextEditingController();
  TextEditingController lugarController = TextEditingController();
  String? _imagen;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.usuario['nombre'];
    descripController.text=widget.usuario['descripcion'];
    lugarController.text=widget.usuario['lugar'];
    _imagen=widget.usuario['foto'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: _imagenactualizar,
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(_imagen!),
                )
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                controller: descripController,
                decoration: InputDecoration(labelText: 'Descripcion'),
              ),
              TextField(
                controller: lugarController,
                decoration: InputDecoration(labelText: 'Lugar'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Aquí puedes implementar la lógica para actualizar los datos en Firestore
                  actualizarDatos();
                },
                child: Text('Guardar Cambios'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _imagenactualizar() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      _uploadImage(File(image.path));
    }
  }

  Future<void> _uploadImage(File image) async {
    try {
      final Reference storageReference = FirebaseStorage.instance.ref().child('imagenes_perfil/${widget.usuario['id']}');
      final UploadTask uploadTask = storageReference.putFile(image);

      final TaskSnapshot downloadUrl = await uploadTask;
      final String url = await downloadUrl.ref.getDownloadURL();

      setState(() {
        _imagen = url;
      });

      Fluttertoast.showToast(
        msg: 'Imagen actualizada',
        toastLength: Toast.LENGTH_SHORT,
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al subir imagen: $e')),
      );
    }
  }
  void actualizarDatos() {
    FirebaseFirestore.instance.collection('usuario')
        .doc(widget.usuario['id']).update({
      'nombre': nameController.text,
      'descripcion':descripController.text,
      'lugar': lugarController.text,
      'foto':_imagen,

    }).then((value) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: 'los datos se actualizaron',
          toastLength: Toast.LENGTH_LONG
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al actualizar: $error')),
      );
    });
  }

}
