import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  List<String> categorias = [
    'Granos',
    'Frutas',
    'Vegetales',
    'Fertilizantes',
    'Herramientas',
  ];
  int current = 0;

  List<Widget> secciones = [
    PrimeraSeccion(),
    SegundaSeccion(),
    TerceraSeccion(),
    CuartaSeccion(),
    QuintaSeccion(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 28, 62, 44),
        title: Row(
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 40,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message,
              color: Colors.white,
              size: 40,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('imagenes/campesino.jpg'),
              ),
            ),
          ),
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
          Expanded(
            child: secciones[current],
          ),
        ],
      ),
    );
  }
}
class PrimeraSeccion extends StatelessWidget {
  const PrimeraSeccion({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            color: Colors.grey,
            height: 250,
            width: 340,
            child: Column(
              children: [
                Row(
                  children: [

                  ],
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text('Un bulto de cafe para palmara',
                    style: TextStyle(
                      fontFamily: 'Barlow',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color.fromARGB(255, 28, 62, 44),
                    ),
                  ),
                ),
                Row(
                  children: [

                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            color: Colors.grey,
            height: 250,
            width: 340,
          ),
          Container(
            margin: EdgeInsets.all(15),
            color: Colors.grey,
            height: 250,
            width: 340,
          ),
          Container(
            margin: EdgeInsets.all(10),
            color: Colors.grey,
            height: 250,
            width: 340,
          )
        ],
      ),
    );
  }
}

class SegundaSeccion extends StatelessWidget {
  const SegundaSeccion({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            color: Colors.grey,
            height: 250,
            width: 340,
            child: Column(
              children: [
                Row(
                  children: [

                  ],
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text('Composta organica para manzanales',
                    style: TextStyle(
                      fontFamily: 'Barlow',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color.fromARGB(255, 28, 62, 44),
                    ),
                  ),
                ),
                Row(
                  children: [

                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            color: Colors.grey,
            height: 250,
            width: 340,
          ),
          Container(
            margin: EdgeInsets.all(15),
            color: Colors.grey,
            height: 250,
            width: 340,
          ),
          Container(
            margin: EdgeInsets.all(10),
            color: Colors.grey,
            height: 250,
            width: 340,
          )
        ],
      ),
    );
  }
}

class TerceraSeccion extends StatelessWidget {
  const TerceraSeccion({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            color: Colors.grey,
            height: 250,
            width: 340,
            child: Column(
              children: [
                Row(
                  children: [

                  ],
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text('Composta organica para manzanales',
                    style: TextStyle(
                      fontFamily: 'Barlow',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color.fromARGB(255, 28, 62, 44),
                    ),
                  ),
                ),
                Row(
                  children: [

                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            color: Colors.grey,
            height: 250,
            width: 340,
          ),
          Container(
            margin: EdgeInsets.all(15),
            color: Colors.grey,
            height: 250,
            width: 340,
          ),
          Container(
            margin: EdgeInsets.all(10),
            color: Colors.grey,
            height: 250,
            width: 340,
          )
        ],
      ),
    );
  }
}

class CuartaSeccion extends StatelessWidget {
  const CuartaSeccion({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            color: Colors.grey,
            height: 250,
            width: 340,
            child: Column(
              children: [
                Row(
                  children: [

                  ],
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text('Composta organica para manzanales',
                    style: TextStyle(
                      fontFamily: 'Barlow',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color.fromARGB(255, 28, 62, 44),
                    ),
                  ),
                ),
                Row(
                  children: [

                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            color: Colors.grey,
            height: 250,
            width: 340,
          ),
          Container(
            margin: EdgeInsets.all(15),
            color: Colors.grey,
            height: 250,
            width: 340,
          ),
          Container(
            margin: EdgeInsets.all(10),
            color: Colors.grey,
            height: 250,
            width: 340,
          )
        ],
      ),
    );
  }
}

class QuintaSeccion extends StatelessWidget {
  const QuintaSeccion({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            color: Colors.grey,
            height: 250,
            width: 340,
            child: Column(
              children: [
                Row(
                  children: [

                  ],
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text('Composta organica para manzanales',
                    style: TextStyle(
                      fontFamily: 'Barlow',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color.fromARGB(255, 28, 62, 44),
                    ),
                  ),
                ),
                Row(
                  children: [

                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            color: Colors.grey,
            height: 250,
            width: 340,
          ),
          Container(
            margin: EdgeInsets.all(15),
            color: Colors.grey,
            height: 250,
            width: 340,
          ),
          Container(
            margin: EdgeInsets.all(10),
            color: Colors.grey,
            height: 250,
            width: 340,
          )
        ],
      ),
    );
  }
}



