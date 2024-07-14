import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'pasarela.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Carrito extends StatefulWidget {
  @override
  State<Carrito> createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  User? usuario = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: usuario == null
          ? Center(
        child: Text('No hay usuario registrado'),
      )
          : StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('carrito')
            .doc(usuario!.uid)
            .collection('items')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No hay productos en el carrito"));
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          var carritos = snapshot.data!.docs;
          double total = _calculartotal(carritos);
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: carritos.length,
                  itemBuilder: (context, index) {
                    var item = carritos[index];
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(15)),
                                  child: Image.network(
                                    item['imagen'],
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    height: 100,
                                    child: Column(
                                      children: [
                                        Text(item['titulo']),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2)),
                                        Text("\$. ${item['precio']}"),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2)),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.remove,
                                                  size: 13,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  decrementarCantidad(
                                                      item);
                                                },
                                              ),
                                              width: 50,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 107, 187, 67),
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          30))),
                                            ),
                                            Container(
                                              width: 20,
                                              child: Center(
                                                child: Text(item['cantidad']
                                                    .toString()),
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.add,
                                                  size: 13,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  incrementarCantidad(
                                                      item);
                                                },
                                              ),
                                              width: 50,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 107, 187, 67),
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          30))),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(
                                        255, 107, 187, 67),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 20, bottom: 10),
                                        child: const Text(
                                          'Total',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight:
                                              FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Text(
                                          "\$. ${item['precio'] * item['cantidad']}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                height: 70,
                width: 400,
                child: Text(
                  'Total: \$${total.toStringAsFixed(0)}',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      vaciarCarrito();
                    },
                    child: Text('Vaciar Carrito',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Pasarela(total: total),
                        ),
                      );
                    },
                    child: Text('Comprar',
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
            ],
          );
        },
      ),
    );
  }

  void incrementarCantidad(DocumentSnapshot item) async {
    await FirebaseFirestore.instance
        .collection('carrito')
        .doc(usuario!.uid)
        .collection('items')
        .doc(item.id)
        .update({'cantidad': item['cantidad'] + 1});
  }

  void decrementarCantidad(DocumentSnapshot item) async {
    if (item['cantidad'] > 1) {
      await FirebaseFirestore.instance.collection('carrito').doc(usuario!.uid).collection('items').doc(item.id).update({'cantidad': item['cantidad'] - 1});
    }
  }

  void vaciarCarrito() async {
    bool confirmarVaciar = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("ALERTA",
            style: TextStyle(fontSize: 20),
          ),
          content: Text("Estas a punto de eliminar todos los productos de tu carrito\n¿Deseas continuar?"),
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
                "Eliminar",
                style: TextStyle(color: Color.fromARGB(255, 28, 62, 44)),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
    if (confirmarVaciar) {
      try {
        var carritoRef = FirebaseFirestore.instance.collection('carrito').doc(usuario!.uid).collection('items');

        var items = await carritoRef.get();
        for (var item in items.docs) {
          await item.reference.delete();
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al realizar la compra')),
        );
      }
    }
  }

  double _calculartotal(List<DocumentSnapshot> carros) {
    double total = 0;
    for (var item in carros) {
      total += item['precio'] * item['cantidad'];
    }
    return total;
  }
}