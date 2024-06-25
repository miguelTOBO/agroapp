import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:splash/paginas/actualizar.dart';

class Cuenta extends StatefulWidget {
  @override
  State<Cuenta> createState() => _CuentaState();
}

class _CuentaState extends State<Cuenta> {
  late User _user;
  bool _isLoading = true;
  late QueryDocumentSnapshot _producto; // Cambiado el tipo aquí

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  void _getUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    _user = auth.currentUser!;
    setState(() {
      _isLoading = false; // Stop loading once user is fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator()); // Show loading while fetching user
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('imagenes/fondoo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('usuario')
                .where('uid', isEqualTo: _user.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(child: Text('No user data found'));
              }

              _producto = snapshot.data!.docs.first; // Actualización aquí

              return Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 550,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(top: 100),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  child: Text(
                                    _producto['nombre'], // Acceso a datos aquí
                                    style: TextStyle(
                                      fontFamily: 'Barlow',
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 20, top: 20),
                                  child: Text(
                                    _producto['correo'], // Acceso a datos aquí
                                    style: TextStyle(
                                      fontFamily: 'Barlow',
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                                child: Text(
                                  '${_producto['descripcion']}', // Acceso a datos aquí
                                  style: TextStyle(
                                    fontFamily: 'Barlow',
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Container(
                                      height: 30,
                                      width: 90,
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 28, 62, 44),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Granjero',
                                          style: TextStyle(
                                            fontFamily: 'Barlow',
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Container(
                                      height: 30,
                                      width: 80,
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 255, 201, 25),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Funza',
                                          style: TextStyle(
                                            fontFamily: 'Barlow',
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Container(
                                      height: 30,
                                      width: 80,
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 107, 187, 67),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '4.1 ⭐',
                                          style: TextStyle(
                                            fontFamily: 'Barlow',
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 20, top: 5),
                                  child: const Text(
                                    'Publicaciones Recientes',
                                    style: TextStyle(
                                      fontFamily: 'Barlow',
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
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
                                height: 220,
                                width: 340,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      child: Text(
                                        'Un bulto de papa para palmara',
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
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                        child: Image.asset(
                                          'imagenes/papa.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(5)),
                                    Container(
                                      height: 50,
                                      width: 150,
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Comprar',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                          ),
                                        ),
                                        style: TextButton.styleFrom(
                                          backgroundColor: Color.fromARGB(255, 107, 187, 67),
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
                                height: 220,
                                width: 340,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      child: Text(
                                        'Un bulto de papa para palmara',
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
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                        child: Image.asset(
                                          'imagenes/papa.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(5)),
                                    Container(
                                      height: 50,
                                      width: 150,
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Comprar',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                          ),
                                        ),
                                        style: TextButton.styleFrom(
                                          backgroundColor: Color.fromARGB(255, 107, 187, 67),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    left: 90,
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color.fromARGB(255, 107, 187, 67),
                          width: 5,
                        ),
                        image: DecorationImage(
                          image: NetworkImage(_producto['foto']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Actualizar(usuario: {
                    ..._producto.data() as Map<String, dynamic>, // Conversión necesaria aquí
                    'id': _producto.id,
                  }),
                ),
              );
            },
            child: Icon(Icons.edit),
            backgroundColor: Color.fromARGB(255, 107, 187, 67),
          ),
        ),
      ),
    );
  }
}

