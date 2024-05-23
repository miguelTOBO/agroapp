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
      body:SingleChildScrollView(
        child:Column(
          children: [
            Center(

              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text('Bandeja de entrada',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Barlow',
                      fontWeight: FontWeight.w500,
                      fontSize: 35,
                      color: Colors.black
                  ),
                ),
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
              height: 120,
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
                          child: Text('User065416515',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Barlow',
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Color.fromARGB(255, 28, 62, 44),
                              ),
                            ),
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
                    margin: EdgeInsets.all(5),
                    child: Text('Un bulto de papa para palmara',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Barlow',
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Color.fromARGB(255, 28, 62, 44),
                      ),
                    ),
                  ),
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
              height: 120,
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
                        child: Text('Llego !!!',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Barlow',
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Color.fromARGB(255, 28, 62, 44),
                          ),
                        ),
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
                    margin: EdgeInsets.all(5),
                    child: Text('Tu compra a llegado a la puerta de tu casa',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Barlow',
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Color.fromARGB(255, 28, 62, 44),
                      ),
                    ),
                  ),
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
              height: 120,
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
                            child: Text('Recordatorio',
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
                          icon: Icon(Icons.cancel,
                            size: 25,
                            color: Color.fromARGB(255, 28, 62, 44),
                          )
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text('No olvides actualizar tus datos',
                      style: TextStyle(
                        fontFamily: 'Barlow',
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Color.fromARGB(255, 28, 62, 44),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      )
    );
  }
}
