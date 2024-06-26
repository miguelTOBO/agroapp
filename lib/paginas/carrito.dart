import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Carrito extends StatefulWidget {
  @override
  State<Carrito> createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  @override
  List<String> categorias = [
    'Enviados',
    'Comprardos',
    'Por pagar',
    'Favoritos',
  ];
  int current = 0;
  List<Widget> secciones = [
    PrimeraSeccion(),
    SegundaSeccion(),
    TerceraSeccion(),
    CuartaSeccion(),
  ];
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
        body: Column(
          children: [
            SizedBox(
              height: 45,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: categorias.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        current = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      margin: EdgeInsets.all(5),
                      width: 100,
                      height: 35,
                      decoration: BoxDecoration(
                        color: current == index
                            ? Color.fromARGB(255, 241, 127, 52)
                            : Color.fromARGB(255, 28, 62, 44),
                        borderRadius: BorderRadius.circular(
                          current == index ? 15 : 10,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          categorias[index],
                          style: TextStyle(
                            fontFamily: 'Barlow',
                            color: current == index
                                ? Color.fromARGB(255, 255, 255, 255)
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              child: secciones[current],
            ),
          ],
        )
    );
  }
}
class PrimeraSeccion extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("imagenes/papa.jpg", width: 150, ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 100,
                    child: Column(
                      children: [
                        Text("Bulto de papa"),
                        Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                        Text("S. 2900"),
                        Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              child: IconButton(
                                icon: Icon(Icons.remove,
                                  size: 13,
                                  color: Colors.white,
                                ), onPressed: () {  },
                              ),
                              width: 50,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 107, 187, 67),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(30)
                                  )
                              ),
                            ),
                            Container(
                              width: 20,
                              child: Center(
                                child: Text("5"),
                              ),
                            ),
                            Container(
                              child: IconButton(
                                icon: Icon(Icons.add,
                                  size: 13,
                                  color: Colors.white,
                                ), onPressed: () {  },
                              ),
                              width: 50,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 107, 187, 67),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(30)
                                  )
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 113,
                  color: Color.fromARGB(255, 107, 187, 67),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20, bottom: 10),
                        child: const Text('Total',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text("S. 14500",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("imagenes/persona.jpg", width: 150, ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 100,
                    child: Column(
                      children: [
                        Text("Algo pa vender"),
                        Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                        Text("S. 6000"),
                        Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              child: IconButton(
                                icon: Icon(Icons.remove,
                                  size: 13,
                                  color: Colors.white,
                                ), onPressed: () {  },
                              ),
                              width: 50,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 107, 187, 67),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(30)
                                  )
                              ),
                            ),
                            Container(
                              width: 20,
                              child: Center(
                                child: Text("2"),
                              ),
                            ),
                            Container(
                              child: IconButton(
                                icon: Icon(Icons.add,
                                  size: 13,
                                  color: Colors.white,
                                ), onPressed: () {  },
                              ),
                              width: 50,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 107, 187, 67),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(30)
                                  )
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 113,
                  color: Color.fromARGB(255, 107, 187, 67),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20, bottom: 10),
                        child: const Text('Total',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text("S. 12000",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white
                          ),
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
  }
}

class SegundaSeccion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TerceraSeccion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CuartaSeccion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}