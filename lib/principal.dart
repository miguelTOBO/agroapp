import 'package:flutter/material.dart';

class principal extends StatelessWidget {
  const principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar:AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(200),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 25),
                    child: Text('hola miguel',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 25
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child:Container(
                    padding: EdgeInsets.only(left: 25),
                    child: Text('Productos y servicios SENA',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(20),
                  height: 60,
                  width: 320,
                  child: TextField(
                    controller: null,
                    decoration: InputDecoration(
                      filled:true,
                      fillColor: Colors.white,
                      hintText: 'busca un producto o servicio',
                      prefixIcon:Icon(Icons.search,
                        color: Colors.black,
                        size: 35,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                        borderSide: BorderSide(color: Color.fromARGB(217, 217, 217, 217)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.indigo,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                image:DecorationImage(
                  image: AssetImage('imagenes/pasto.png'),
                  fit: BoxFit.cover,
                )
            ),
          ),
          leading: Icon(Icons.settings,
            color: Colors.white,
            size: 35,
          ),
          actions: [
            Container(
              margin: EdgeInsets.all(5),
              height: 150,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)
                ),
                child: Image.asset(
                  'imagenes/persona.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        body: Expanded(
          child: Container(
            height: 82,
            color:Color.fromARGB(255, 39, 76, 119),
            child: Row(
              children: [
                Container(
                  padding:EdgeInsets.all(15),
                  child:Column(
                    children: [
                      Container(
                        child: Icon(Icons.shopping_cart_outlined,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        child: Text('Carrito',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:EdgeInsets.all(15),
                  child:Column(
                    children: [
                      Container(
                        child:Text('hola')
                      ),
                      Container(
                        child: Text('Mensajes',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:EdgeInsets.all(10),
                  child:Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape:BoxShape.circle,
                            color:Colors.white
                        ),
                        child: Icon(Icons.home,
                          size: 25,
                          color: Color.fromARGB(255, 39, 76, 119),
                        ),
                      ),
                      Container(
                        child: Text('Home',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:EdgeInsets.all(15),
                  child:Column(
                    children: [
                      Container(
                        child: Icon(Icons.person_outline,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        child: Text('Perfil',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:EdgeInsets.all(15),
                  child:Column(
                    children: [
                      Container(
                        child: Icon(Icons.heart_broken,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        child: Text('Favoritos',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 28, 62, 44),
          type: BottomNavigationBarType.fixed,
          iconSize: 35,
          selectedItemColor:Color.fromARGB(255, 107, 187, 67),

          items: [
            BottomNavigationBarItem(
                icon:Icon(Icons.shopping_cart_outlined,
                  color:Color.fromARGB(255, 107, 187, 67),
                ),
              label: 'Carro',

            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.message,
                color: Colors.white,
              ),
              label: 'Mensaje',
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.home,
                color: Colors.white,
              ),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.person_outline,
                color: Colors.white,
              ),
              label: 'perfil',
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.heart_broken,
                color: Colors.white,
              ),
              label: 'favoritos',
            ),
          ],
        ),
      ),
    );
  }
}


