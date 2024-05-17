import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      body: SingleChildScrollView(
        child:Column(
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
            Container(
              child: secciones[current],
            ),
          ],
        ),
      )

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
            height: 290,
            width: 340,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)
                        ),
                        child: Image.asset(
                          'imagenes/persona.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text('User065416515',
                          style: TextStyle(
                            fontFamily: 'Barlow',
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Color.fromARGB(255, 28, 62, 44),
                          ),
                        ),
                      )
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.scatter_plot,
                          size: 25,
                          color: Color.fromARGB(255, 28, 62, 44),
                        )
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.cancel,
                          size: 25,
                          color: Color.fromARGB(255, 28, 62, 44),
                        )
                    ),
                  ],
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: Color.fromARGB(255, 28, 62, 44),
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                        alignment: Alignment.center,
                        children: [
                          IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.library_add_check,
                                size: 28,
                                color: Color.fromARGB(255, 28, 62, 44),
                              )),
                          Container(
                            margin: EdgeInsets.only(top:45),
                            child: Text('Me gusta',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    Stack(
                        alignment: Alignment.center,
                        children: [
                          IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.comment,
                                size: 28,
                                color: Color.fromARGB(255, 28, 62, 44),
                              )),
                          Container(
                            margin: EdgeInsets.only(top:45),
                            child: Text('Comentarios',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),

                    Stack(
                        alignment: Alignment.center,
                        children: [
                          IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.link,
                                size: 28,
                                color: Color.fromARGB(255, 28, 62, 44),
                              )),
                          Container(
                            margin: EdgeInsets.only(top:45),
                            child: Text('Compartir',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    Stack(
                        alignment: Alignment.center,
                        children: [
                          IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.shopping_cart,
                                size: 28,
                                color: Color.fromARGB(255, 28, 62, 44),
                              )),
                          Container(
                            margin: EdgeInsets.only(top:45),
                            child: Text('Añadir',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      )
                  ],
                )
              ],
            ),
          ),
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
            height: 290,
            width: 340,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)
                        ),
                        child: Image.asset(
                          'imagenes/persona.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        child: Center(
                          child: Text('User065416515',
                            style: TextStyle(
                              fontFamily: 'Barlow',
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Color.fromARGB(255, 28, 62, 44),
                            ),
                          ),
                        )
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.scatter_plot,
                          size: 25,
                          color: Color.fromARGB(255, 28, 62, 44),
                        )
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.cancel,
                          size: 25,
                          color: Color.fromARGB(255, 28, 62, 44),
                        )
                    ),
                  ],
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: Color.fromARGB(255, 28, 62, 44),
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.library_add_check,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Me gusta',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.comment,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Comentarios',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.link,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Compartir',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.shopping_cart,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Añadir',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
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
  const SegundaSeccion({super.key});

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
            height: 290,
            width: 340,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)
                        ),
                        child: Image.asset(
                          'imagenes/persona.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        child: Center(
                          child: Text('User065416515',
                            style: TextStyle(
                              fontFamily: 'Barlow',
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Color.fromARGB(255, 28, 62, 44),
                            ),
                          ),
                        )
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.scatter_plot,
                          size: 25,
                          color: Color.fromARGB(255, 28, 62, 44),
                        )
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.cancel,
                          size: 25,
                          color: Color.fromARGB(255, 28, 62, 44),
                        )
                    ),
                  ],
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: Color.fromARGB(255, 28, 62, 44),
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.library_add_check,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Me gusta',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.comment,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Comentarios',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.link,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Compartir',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.shopping_cart,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Añadir',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
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
            height: 290,
            width: 340,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)
                        ),
                        child: Image.asset(
                          'imagenes/persona.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        child: Center(
                          child: Text('User065416515',
                            style: TextStyle(
                              fontFamily: 'Barlow',
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Color.fromARGB(255, 28, 62, 44),
                            ),
                          ),
                        )
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.scatter_plot,
                          size: 25,
                          color: Color.fromARGB(255, 28, 62, 44),
                        )
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.cancel,
                          size: 25,
                          color: Color.fromARGB(255, 28, 62, 44),
                        )
                    ),
                  ],
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: Color.fromARGB(255, 28, 62, 44),
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.library_add_check,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Me gusta',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.comment,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Comentarios',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.link,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Compartir',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.shopping_cart,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Añadir',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
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
            height: 290,
            width: 340,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)
                        ),
                        child: Image.asset(
                          'imagenes/persona.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        child: Center(
                          child: Text('User065416515',
                            style: TextStyle(
                              fontFamily: 'Barlow',
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Color.fromARGB(255, 28, 62, 44),
                            ),
                          ),
                        )
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.scatter_plot,
                          size: 25,
                          color: Color.fromARGB(255, 28, 62, 44),
                        )
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.cancel,
                          size: 25,
                          color: Color.fromARGB(255, 28, 62, 44),
                        )
                    ),
                  ],
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: Color.fromARGB(255, 28, 62, 44),
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.library_add_check,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Me gusta',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.comment,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Comentarios',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.link,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Compartir',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.shopping_cart,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Añadir',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
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
            height: 290,
            width: 340,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)
                        ),
                        child: Image.asset(
                          'imagenes/persona.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        child: Center(
                          child: Text('User065416515',
                            style: TextStyle(
                              fontFamily: 'Barlow',
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Color.fromARGB(255, 28, 62, 44),
                            ),
                          ),
                        )
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.scatter_plot,
                          size: 25,
                          color: Color.fromARGB(255, 28, 62, 44),
                        )
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.cancel,
                          size: 25,
                          color: Color.fromARGB(255, 28, 62, 44),
                        )
                    ),
                  ],
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: Color.fromARGB(255, 28, 62, 44),
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.library_add_check,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Me gusta',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.comment,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Comentarios',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.link,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Compartir',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.shopping_cart,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Añadir',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
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
            height: 290,
            width: 340,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)
                        ),
                        child: Image.asset(
                          'imagenes/persona.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        child: Center(
                          child: Text('User065416515',
                            style: TextStyle(
                              fontFamily: 'Barlow',
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Color.fromARGB(255, 28, 62, 44),
                            ),
                          ),
                        )
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.scatter_plot,
                          size: 25,
                          color: Color.fromARGB(255, 28, 62, 44),
                        )
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.cancel,
                          size: 25,
                          color: Color.fromARGB(255, 28, 62, 44),
                        )
                    ),
                  ],
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: Color.fromARGB(255, 28, 62, 44),
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.library_add_check,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Me gusta',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.comment,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Comentarios',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.link,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Compartir',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.shopping_cart,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Añadir',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
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
            height: 290,
            width: 340,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)
                        ),
                        child: Image.asset(
                          'imagenes/persona.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        child: Center(
                          child: Text('User065416515',
                            style: TextStyle(
                              fontFamily: 'Barlow',
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Color.fromARGB(255, 28, 62, 44),
                            ),
                          ),
                        )
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.scatter_plot,
                          size: 25,
                          color: Color.fromARGB(255, 28, 62, 44),
                        )
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.cancel,
                          size: 25,
                          color: Color.fromARGB(255, 28, 62, 44),
                        )
                    ),
                  ],
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: Color.fromARGB(255, 28, 62, 44),
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.library_add_check,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Me gusta',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.comment,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Comentarios',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.link,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Compartir',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.shopping_cart,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Añadir',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
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
            height: 290,
            width: 340,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)
                        ),
                        child: Image.asset(
                          'imagenes/persona.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        child: Center(
                          child: Text('User065416515',
                            style: TextStyle(
                              fontFamily: 'Barlow',
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Color.fromARGB(255, 28, 62, 44),
                            ),
                          ),
                        )
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.scatter_plot,
                          size: 25,
                          color: Color.fromARGB(255, 28, 62, 44),
                        )
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.cancel,
                          size: 25,
                          color: Color.fromARGB(255, 28, 62, 44),
                        )
                    ),
                  ],
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: Color.fromARGB(255, 28, 62, 44),
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.library_add_check,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Me gusta',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.comment,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Comentarios',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.link,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Compartir',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.shopping_cart,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Añadir',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
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
            height: 290,
            width: 340,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)
                        ),
                        child: Image.asset(
                          'imagenes/persona.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        child: Center(
                          child: Text('User065416515',
                            style: TextStyle(
                              fontFamily: 'Barlow',
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Color.fromARGB(255, 28, 62, 44),
                            ),
                          ),
                        )
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.scatter_plot,
                          size: 25,
                          color: Color.fromARGB(255, 28, 62, 44),
                        )
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.cancel,
                          size: 25,
                          color: Color.fromARGB(255, 28, 62, 44),
                        )
                    ),
                  ],
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: Color.fromARGB(255, 28, 62, 44),
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.library_add_check,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Me gusta',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.comment,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Comentarios',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.link,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Compartir',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.shopping_cart,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Añadir',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
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
            height: 290,
            width: 340,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)
                        ),
                        child: Image.asset(
                          'imagenes/persona.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        child: Center(
                          child: Text('User065416515',
                            style: TextStyle(
                              fontFamily: 'Barlow',
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Color.fromARGB(255, 28, 62, 44),
                            ),
                          ),
                        )
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.scatter_plot,
                          size: 25,
                          color: Color.fromARGB(255, 28, 62, 44),
                        )
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.cancel,
                          size: 25,
                          color: Color.fromARGB(255, 28, 62, 44),
                        )
                    ),
                  ],
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: Color.fromARGB(255, 28, 62, 44),
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.library_add_check,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Me gusta',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.comment,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Comentarios',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.link,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Compartir',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.shopping_cart,
                              size: 28,
                              color: Color.fromARGB(255, 28, 62, 44),
                            )),
                        Container(
                          margin: EdgeInsets.only(top:45),
                          child: Text('Añadir',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}



