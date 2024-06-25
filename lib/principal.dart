import 'package:flutter/material.dart';
import 'package:splash/paginas/inicio.dart';
import 'package:splash/paginas/cuenta.dart';
import 'package:splash/paginas/publicar.dart';
import 'package:splash/paginas/notificar.dart';
import 'package:splash/paginas/carrito.dart';


class principal extends StatefulWidget {
  @override
  State<principal> createState() => _principalState();
}

class _principalState extends State<principal> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    final paginas=[Inicio(),Cuenta(),Publicar(),Notificar(),Carrito()];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          index:index,
          children: paginas,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (int i){
            setState(() {
              index=i;
            });
          },
          backgroundColor: Color.fromARGB(255, 28, 62, 44),
          type: BottomNavigationBarType.fixed,
          iconSize: 35,
          selectedItemColor:Color.fromARGB(255, 107, 187, 67),
          selectedFontSize: 15,
          unselectedFontSize: 12,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon:Icon(Icons.home,),
              label: 'Inicio',

            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.person,),
              label: 'Cuenta',
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.add_box_rounded,),
              label: 'Publicar',
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.notifications,),
              label: 'Notificar',
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.shopping_cart,),
              label: 'Carro',
            ),
          ],
        ),
      ),
    );
  }
}