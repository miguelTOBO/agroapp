import 'package:flutter/material.dart';


class Notificar extends StatefulWidget {
  const Notificar({super.key});

  @override
  State<Notificar> createState() => _NotificarState();
}

class _NotificarState extends State<Notificar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child:Text('Pagiona 4',
        style: TextStyle(fontSize: 30),
      )),
    );
  }
}
