import 'package:flutter/material.dart';

class Carrito extends StatefulWidget {
  const Carrito({super.key});

  @override
  State<Carrito> createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child:Text('Pagiona 5',
        style: TextStyle(fontSize: 30),
      )),
    );
  }
}
