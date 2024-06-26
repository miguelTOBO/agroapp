import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  @override
  void initState() {
    super.initState();
    // Inicializar el controlador con el nombre actual del usuario
    nameController.text = widget.usuario['nombre'];
    descripController.text=widget.usuario['descripcion'];
    lugarController.text=widget.usuario['lugar'];
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
    );
  }

  void actualizarDatos() {
    String nuevoNombre = nameController.text;
    String nuevaDescripcion = descripController.text;
    String nuevoLugar = lugarController.text;
    // Ejemplo de actualización de nombre en Firestore
    FirebaseFirestore.instance.collection('usuario')
        .doc(widget.usuario['id']).update({
      'nombre': nuevoNombre,
      'descripcion': nuevaDescripcion,
      'lugar':nuevoLugar,
      // Aquí puedes agregar más campos para actualizar según sea necesario
    })
        .then((value) {
      // Éxito al actualizar
      Navigator.pop(context);
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
