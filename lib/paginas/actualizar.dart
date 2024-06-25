import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:splash/principal.dart';

class Actualizar extends StatefulWidget {
  final Map<String, dynamic> usuario;

  Actualizar({required this.usuario});

  @override
  State<Actualizar> createState() => _ActualizarState();
}

class _ActualizarState extends State<Actualizar> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descripController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inicializar el controlador con el nombre actual del usuario
    nameController.text = widget.usuario['nombre'];
    descripController.text=widget.usuario['descripcion'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
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
              controller: descripController,
              decoration: InputDecoration(labelText: 'Descripcion'),
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
    );
  }

  void actualizarDatos() {
    String nuevoNombre = nameController.text;
    String nuevaDescripcion = descripController.text;
    // Ejemplo de actualización de nombre en Firestore
    FirebaseFirestore.instance.collection('usuario')
        .doc(widget.usuario['id']).update({
      'nombre': nuevoNombre,
      'descripcion': nuevaDescripcion,
      // Aquí puedes agregar más campos para actualizar según sea necesario
    })
        .then((value) {
      // Éxito al actualizar
      Navigator.pushReplacement(context,
          MaterialPageRoute(
              builder: (context) => principal()));
      Fluttertoast.showToast(msg: 'los datos se actualizaron',
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
