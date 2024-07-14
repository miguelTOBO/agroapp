import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:splash/principal.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Pasarela extends StatefulWidget {
  final double total;
  Pasarela({required this.total});
  @override
  State<Pasarela> createState() => _PublicarState();
}

class _PublicarState extends State<Pasarela> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombre = TextEditingController();
  final TextEditingController _direccion = TextEditingController();
  final TextEditingController _especificaciones = TextEditingController();
  final TextEditingController _cpostal = TextEditingController();

  List<String> pagos = [
    'Efecty',
    'Nequi',
    'Daviplata',
    'Bancolombia',
    'Caja social'
  ];
  String? valorPagos;

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
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      'Pasarela de pago',
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
                  child: Center(
                    child: Text(
                      'Llena todos los campos de información para finalizar tu compra',
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
                  child: TextFormField(
                    controller: _nombre,
                    decoration: InputDecoration(hintText: 'Nombre y apellido del recibidor'),
                    validator: (value) {
                      if (value!.isEmpty) return 'Ingrese un nombre y apellido';
                    },
                    onSaved: (value) {
                      _nombre.text = value!;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    controller: _direccion,
                    decoration: InputDecoration(hintText: 'Dirección'),
                    validator: (value) {
                      if (value!.isEmpty) return 'Ingrese una dirección';
                    },
                    onSaved: (value) {
                      _direccion.text = value!;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    controller: _especificaciones,
                    decoration: InputDecoration(hintText: 'Especificaciones (Número apartamento, nombre zona residencial etc) Opcional'),
                    onSaved: (value) {
                      _especificaciones.text = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: _cpostal,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Código postal (Opcional)'),
                    onSaved: (value) {
                      _cpostal.text = value!;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: DropdownButtonFormField<String>(
                    value: valorPagos,
                    decoration: InputDecoration(hintText: 'Método de pago'),
                    onChanged: (newValue) {
                      setState(() {
                        valorPagos = newValue;
                      });
                    },
                    validator: (value) => value == null ? 'Seleccione un método de pago' : null,
                    items: pagos.map<DropdownMenuItem<String>>((String valueItem) {
                      return DropdownMenuItem<String>(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Total a pagar: \$ 152000',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        comprarProducto();
                      }
                    },
                    child: Text(
                      'Finalizar compra',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 28, 62, 44),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void comprarProducto() async {
    bool confirmarCompra = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Confirmar Compra",
            style: TextStyle(fontSize: 20),
          ),
          content: Text("¿Estás seguro de que deseas comprar estos productos?"),
          actions: [
            TextButton(
              child: Text(
                "Cancelar",
                style: TextStyle(color: Color.fromARGB(255, 28, 62, 44)),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text(
                "Finalizar compra",
                style: TextStyle(color: Color.fromARGB(255, 28, 62, 44)),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
                calificacion();
              },
            ),
          ],
        );
      },
    );
    if (confirmarCompra) {
      try {
        FirebaseAuth auth = FirebaseAuth.instance;
        User? currentUser = auth.currentUser;
        final compraRef = FirebaseFirestore.instance.collection('compras');
        await compraRef.add({
          'nombre': _nombre.text,
          'direccion': _direccion.text,
          'especificaciones': _especificaciones.text,
          'cpostal': _cpostal.text,
          'categoria': valorPagos,
          'uid': currentUser!.uid,
          'total': widget.total,
        });

        final carritoRef = FirebaseFirestore.instance.collection('carrito').doc(currentUser.uid).collection('items');

        var items = await carritoRef.get();
        for (var item in items.docs) {
          await item.reference.delete();
        }

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => principal()));

      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al realizar la compra')),
        );
      }
    }
  }

  void calificacion() async {
    bool confirmarCalificacion = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "FELICIDADES",
            style: TextStyle(fontSize: 20),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Tu compra a sido un exito!!! Para finalizar por favor dinos\n¿Como calificarias tu experiencia con nosotros?"),
                SizedBox(height: 20),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                "Cancelar",
                style: TextStyle(color: Color.fromARGB(255, 28, 62, 44)),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text(
                "Enviar",
                style: TextStyle(color: Color.fromARGB(255, 28, 62, 44)),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => principal()));
              },
            ),
          ],
        );
      },
    );
    if (confirmarCalificacion) {
      try {
        Fluttertoast.showToast(
          msg: 'Muchas gracias por compartirnos tu opinion.',
          gravity: ToastGravity.CENTER,
        );
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => principal()));

      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al realizar la compra')),
        );
      }
    }
  }
}