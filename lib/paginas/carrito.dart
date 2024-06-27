import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Carrito extends StatefulWidget {
  @override
  State<Carrito> createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  User? usuario=FirebaseAuth.instance.currentUser;
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
        body: usuario==null?Center(
          child: Text('no hay usuario registrado'),
        ):StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('carrito').doc(usuario!.uid).collection('items').snapshots(),
            builder: (context,snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(child: Text("No hay productos en el carrito"));
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              var carritos=snapshot.data!.docs;

              return ListView.builder(
                  itemCount: carritos.length,
                  itemBuilder: (context,index){
                    var item=carritos[index];
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(15)
                                  ),
                                  child: Image.network(
                                    item['imagen'],
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    height: 100,
                                    child: Column(
                                      children: [
                                        Text(item['titulo']),
                                        Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                                        Text("\$. ${item['precio']}"),
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
                                  height: 120,
                                  decoration:BoxDecoration(
                                    color: Color.fromARGB(255, 107, 187, 67),
                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),topRight: Radius.circular(10) ),
                                  ),
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
                                        child: Text("\$. 12000",
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
              );
            }
        )
    );
  }
}
