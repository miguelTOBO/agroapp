import 'package:flutter/material.dart';

class Carrito extends StatefulWidget {
  const Carrito({super.key});

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
    PrimeSeccion(),
    SegunSeccion(),
    TercerSeccion(),
    CuarSeccion(),
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
class PrimeSeccion extends StatelessWidget {
  const PrimeSeccion({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 241, 241, 241),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            height: 220,
            width: 340,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text('Un bulto de papa para palmara',
                    style: TextStyle(
                      fontFamily: 'Barlow',
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Color.fromARGB(255, 28, 62, 44),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  height: 100,
                  width: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)
                    ),
                    child: Image.asset(
                      'imagenes/papa.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(5)
                ),

                Container(
                    height: 50,
                    width: 150,
                    child:TextButton(onPressed: (){
                    },
                      child: Text('Comprar',
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      style:TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 107, 187, 67)
                      ),

                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class SegunSeccion extends StatelessWidget {
  const SegunSeccion({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 241, 241, 241),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            height: 220,
            width: 340,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text('Un bulto de papa para palmara',
                    style: TextStyle(
                      fontFamily: 'Barlow',
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Color.fromARGB(255, 28, 62, 44),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  height: 100,
                  width: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)
                    ),
                    child: Image.asset(
                      'imagenes/papa.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(5)
                ),

                Container(
                    height: 50,
                    width: 150,
                    child:TextButton(onPressed: (){
                    },
                      child: Text('Comprar',
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      style:TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 107, 187, 67)
                      ),
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class TercerSeccion extends StatelessWidget {
  const TercerSeccion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.orange,
    );
  }
}

class CuarSeccion extends StatelessWidget {
  const CuarSeccion ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.red,
    );
  }
}
