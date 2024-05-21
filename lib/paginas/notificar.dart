import 'package:flutter/material.dart';


class Notificar extends StatefulWidget {
  //const Notificar({super.key});

  @override
  State<Notificar> createState() => _NotificarState();
}

class _NotificarState extends State<Notificar> {
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

    );
  }
}
