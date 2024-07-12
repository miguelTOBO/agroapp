import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  @override
  void initState() {
    super.initState();
    // Inicializar el controlador con el nombre actual del usuario
    nameController.text = widget.producto['titulo'];
    descripcionController.text=widget.producto['descripcion'];
    precioController.text=widget.producto['precio'];
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Producto - ${widget.producto['titulo']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
            ElevatedButton(
              onPressed: () {
                actualizarDatos();
              },
              child: Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }
  void actualizarDatos() {
    String nuevoNombre = nameController.text;
    String nuevaDescripcion = descripcionController.text;
    int nuevoPrecio =  int.parse(precioController.text);
    // Ejemplo de actualización de nombre en Firestore
    FirebaseFirestore.instance.collection('productos')
        .doc(widget.producto['id']).update({
      'titulo': nuevoNombre,
      'descripcion': nuevaDescripcion,
      'lugar':nuevoPrecio,
      // Aquí puedes agregar más campos para actualizar según sea necesario
    })
        .then((value) {
      // Éxito al actualizar
      Navigator.pop(context);
      Fluttertoast.showToast(msg: 'los datos del producto se actualizaron',
          toastLength: Toast.LENGTH_LONG
      );
    })
        .catchError((error) {
      // Manejo de errores
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al actualizar: $error')),
      );
    });
  }
}
