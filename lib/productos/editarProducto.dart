import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class EditarProducto extends StatefulWidget {
  final Map<String, dynamic> producto;

  EditarProducto({required this.producto});

  @override
  State<EditarProducto> createState() => _EditarProductoState();
}

class _EditarProductoState extends State<EditarProducto> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();
  TextEditingController precioController = TextEditingController();
  TextEditingController cantiController = TextEditingController();
  String? _imagen_upda;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.producto['titulo'];
    descripcionController.text=widget.producto['descripcion'];
    precioController.text=widget.producto['precio'];
    cantiController.text=widget.producto['cantidad'];
    _imagen_upda = widget.producto['imagen'];
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Producto - ${widget.producto['titulo']}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: _imageeenedi,
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: _imagen_upda != null
                      ? NetworkImage(_imagen_upda!)
                      : AssetImage('assets/placeholder.png') as ImageProvider,
                ),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                controller: descripcionController,
                decoration: InputDecoration(labelText: 'Descripcion'),
              ),
              TextField(
                controller: precioController,
                decoration: InputDecoration(labelText: 'Lugar'),
              ),
              TextField(
                controller: cantiController,
                decoration: InputDecoration(labelText: 'Cantidad'),
              ),
              ElevatedButton(
                onPressed: () {
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
  Future<XFile?> _imageeenedi()async{
    final ImagePicker _picker=ImagePicker();
    final XFile? image=await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      _uploadImage(File(image.path));
    }
  }

  Future<void> _uploadImage(File image) async {
    try {
      final Reference storageReference = FirebaseStorage.instance.ref().child('imagenes_perfil/${widget.producto['id']}');
      final UploadTask uploadTask = storageReference.putFile(image);
      final TaskSnapshot downloadUrl = await uploadTask;
      final String url = await downloadUrl.ref.getDownloadURL();

      setState(() {
        _imagen_upda = url;
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

  Future<void> actualizarDatos() async {
    FirebaseFirestore.instance.collection('productos').doc(widget.producto['id']).update({
      'titulo': nameController,
      'descripcion': descripcionController,
      'precio':precioController,
      'cantidad': cantiController,
      'imagen': _imagen_upda
    })
        .then((value) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: 'los datos del producto se actualizaron',
          toastLength: Toast.LENGTH_LONG
      );
    })
        .catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al actualizar: $error')),
      );
    });
  }
}
