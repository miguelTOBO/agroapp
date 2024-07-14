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
  String? _imagen_upda;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.producto['titulo'];
    descripcionController.text=widget.producto['descripcion'];
    precioController.text=widget.producto['precio'].toString();
    _imagen_upda = widget.producto['imagen'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 28, 62, 44),
        title: Text('Editar Producto - ${widget.producto['titulo']}',
          style:TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 40,),
              GestureDetector(
                onTap: _imageeenedi,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  backgroundImage: NetworkImage(_imagen_upda!)
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
                keyboardType: TextInputType.number,
                controller: precioController,
                decoration: InputDecoration(labelText: 'Precio'),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () {

                  actualizarDatos();
                },
                child: Text('Guardar Cambios',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
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
    try {
      int precio = int.parse(precioController.text);
      await FirebaseFirestore.instance.collection('productos').doc(widget.producto['id']).update({
        'titulo': nameController.text,
        'descripcion': descripcionController.text,
        'precio': precio,
        'imagen': _imagen_upda
      });

      Navigator.pop(context);
      Fluttertoast.showToast(
        msg: 'Los datos del producto se actualizaron',
        toastLength: Toast.LENGTH_LONG,
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al actualizar: $error')),
      );
    }
  }
}