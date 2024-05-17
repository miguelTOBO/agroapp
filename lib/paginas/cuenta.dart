import 'package:flutter/material.dart';

class Cuenta extends StatefulWidget {
  const Cuenta({super.key});

  @override
  State<Cuenta> createState() => _CuentaState();
}

class _CuentaState extends State<Cuenta> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child:Text('Pagiona 2',
        style: TextStyle(fontSize: 30),
      )),
    );
  }
}
