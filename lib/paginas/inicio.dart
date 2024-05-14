import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  List<String> items = [
    "Granos",
    "Frutas",
    "Vegetales",
    "Fertilisantes",
    "Herramientas",
  ];
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar:AppBar(
          backgroundColor:Color.fromARGB(255, 28, 62, 44),
          title: Row(
            children: [
              Text('AGRO',
                style: TextStyle(
                  fontFamily: 'Barlow',
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              Text('APP',
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
            onPressed: (){
            },
            icon: Icon(Icons.search,
            color: Colors.white,
            size: 40,
            )
            ),
            IconButton(
            onPressed: (){
            },
            icon: Icon(Icons.message,
            color: Colors.white,
            size: 40,
            )
            ),
          ],
        ),
       body:ListView(
          children: [
            Expanded(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit:BoxFit.cover,
                        image: AssetImage('imagenes/campesino.jpg',
                        ),
                    )
                  ),
                )
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:Row(
                children: [
                  Container(
                        margin:EdgeInsets.all(7),
                        height: 38,
                        width: 80,
                        child:TextButton(onPressed: (){
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>principal()));
                        },
                          child: Text('Granos',
                            style: TextStyle(
                              fontFamily: 'Barlow',
                              color:Color.fromARGB(255, 28, 62, 44),
                              fontSize: 15,
                            ),
                          ),
                          style:TextButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 241, 127, 52),
                          ),
                        )
                    ),
                  Container(
                        margin:EdgeInsets.all(7),
                        height: 38,
                        width: 80,
                        child:TextButton(onPressed: (){
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>principal()));
                        },
                          child: Text('Frutas',
                            style: TextStyle(
                              fontFamily: 'Barlow',
                              color:Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          style:TextButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 28, 62, 44),
                          ),
                        )
                    ),

                  Container(
                        margin:EdgeInsets.all(7),
                        height: 38,
                        width: 100,
                        child:TextButton(onPressed: (){
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>principal()));
                        },
                          child: Text('Vegetales',
                            style: TextStyle(
                              fontFamily: 'Barlow',
                              color:Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          style:TextButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 28, 62, 44),
                          ),
                        )
                    ),
                  Container(
                        margin:EdgeInsets.all(7),
                        height: 38,
                        width: 120,
                        child:TextButton(onPressed: (){
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>principal()));
                        },
                          child: Text('Fertilisantes',
                            style: TextStyle(
                              fontFamily: 'Barlow',
                              color:Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          style:TextButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 28, 62, 44),
                          ),
                        )
                    ),
                  Container(
                        margin:EdgeInsets.all(7),
                        height: 38,
                        width: 120,
                        child:TextButton(onPressed: (){
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>principal()));
                        },
                          child: Text('Herramientas',
                            style: TextStyle(
                              fontFamily: 'Barlow',
                              color:Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          style:TextButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 28, 62, 44),
                          ),
                        )
                    ),

                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    height: 90,
                    width: 115,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                      ),
                      child: Image.asset(
                        'imagenes/campesino.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height:44,
                            width:55,
                            margin:EdgeInsets.only(top:10),
                            color:Colors.grey[600],
                          ),
                          Container(
                            height:44,
                            width:55,
                            margin:EdgeInsets.only(top:1),
                            decoration: BoxDecoration(
                              color:Colors.grey[600], //light blue
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    height: 90,
                    width: 115,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                      ),
                      child: Image.asset(
                        'imagenes/campesino.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height:44,
                            width:55,
                            margin:EdgeInsets.only(top:10),
                            color:Colors.grey[600],
                          ),
                          Container(
                            height:44,
                            width:55,
                            margin:EdgeInsets.only(top:1),
                            decoration: BoxDecoration(
                              color:Colors.grey[600], //light blue
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    height: 90,
                    width: 115,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                      ),
                      child: Image.asset(
                        'imagenes/campesino.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height:44,
                            width:55,
                            margin:EdgeInsets.only(top:10),
                            color:Colors.grey[600],
                          ),
                          Container(
                            height:44,
                            width:55,
                            margin:EdgeInsets.only(top:1),
                            decoration: BoxDecoration(
                              color:Colors.grey[600], //light blue
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    height: 90,
                    width: 115,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                      ),
                      child: Image.asset(
                        'imagenes/campesino.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height:44,
                            width:55,
                            margin:EdgeInsets.only(top:10),
                            color:Colors.grey[600],
                          ),
                          Container(
                            height:44,
                            width:55,
                            margin:EdgeInsets.only(top:1),
                            decoration: BoxDecoration(
                              color:Colors.grey[600], //light blue
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    height: 90,
                    width: 115,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                      ),
                      child: Image.asset(
                        'imagenes/campesino.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height:44,
                            width:55,
                            margin:EdgeInsets.only(top:10),
                            color:Colors.grey[600],
                          ),
                          Container(
                            height:44,
                            width:55,
                            margin:EdgeInsets.only(top:1),
                            decoration: BoxDecoration(
                              color:Colors.grey[600], //light blue
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    height: 90,
                    width: 115,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                      ),
                      child: Image.asset(
                        'imagenes/campesino.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height:44,
                            width:55,
                            margin:EdgeInsets.only(top:10),
                            color:Colors.grey[600],
                          ),
                          Container(
                            height:44,
                            width:55,
                            margin:EdgeInsets.only(top:1),
                            decoration: BoxDecoration(
                              color:Colors.grey[600], //light blue
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
