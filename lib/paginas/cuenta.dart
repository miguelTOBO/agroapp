import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:splash/paginas/actualizar.dart';
import 'package:splash/iniciar_sesion.dart';

class Cuenta extends StatefulWidget {
  @override
  State<Cuenta> createState() => _CuentaState();
}

class _CuentaState extends State<Cuenta> {
  late User _user;
  bool _isLoading = true;
  late QueryDocumentSnapshot _usuario;

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

  void cerrarSesion() async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(context,
      MaterialPageRoute(
        builder: (context) => listados(),
      ),
    );
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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                icon: Icon(Icons.logout,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: cerrarSesion,
              ),
            ],
          ),
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

              _usuario = snapshot.data!.docs.first;

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
                                    _usuario['nombre'],
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
                                    _usuario['correo'],
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
                                  '${_usuario['descripcion']}',
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
                                      child: Center(
                                        child: Text(
                                          _usuario['lugar'],
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
                              StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('productos')
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
                                    return Center(child: Text('Lo sentimos, el usuario no tiene productos'));
                                  }

                                  return ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      var producto = snapshot.data!.docs[index];
                                      return Container(
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
                                        height: 260,
                                        width: 340,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                IconButton(
                                                    onPressed: (){},
                                                    icon: Icon(Icons.scatter_plot,
                                                      size: 25,
                                                      color: Color.fromARGB(255, 28, 62, 44),
                                                    )
                                                ),
                                                Container(
                                                    child: Center(
                                                      child: Text('${producto['titulo']} - ${producto['categoria']}',
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
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
                                              ],
                                            ),
                                            Container(
                                              height: 2,
                                              width: double.infinity,
                                              color: Color.fromARGB(255, 28, 62, 44),
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(5),
                                              child: Text('${producto['descripcion']} - \$ ${producto['precio']}',
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
                                                child: Image.network(
                                                  producto['imagen'],
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(5),
                                                  child: TextButton(
                                                    onPressed: () {

                                                    },
                                                    child: Row(
                                                        children: [
                                                          Icon(Icons.edit,
                                                              color: Colors.white,
                                                              size: 22
                                                          ),
                                                          Padding(padding: EdgeInsets.all(5)),
                                                          Text('Editar',
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 18,
                                                            ),
                                                          )
                                                        ]
                                                    ),
                                                    style: TextButton.styleFrom(
                                                      backgroundColor: Color.fromARGB(255, 107, 187, 67),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(5),
                                                  child: TextButton(
                                                    onPressed: () {

                                                    },
                                                    child: Row(
                                                        children: [
                                                          Icon(Icons.delete,
                                                              color: Colors.white,
                                                              size: 22
                                                          ),
                                                          Padding(padding: EdgeInsets.all(5)),
                                                          Text('Eliminar',
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 18,
                                                            ),
                                                          )
                                                        ]
                                                    ),
                                                    style: TextButton.styleFrom(
                                                      backgroundColor: Colors.red,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 180,
                      height: 180,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color.fromARGB(255, 107, 187, 67),
                          width: 5,
                        ),
                        image: DecorationImage(
                          image: NetworkImage(_usuario['foto']),
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
                    ..._usuario.data() as Map<String, dynamic>, // Conversión necesaria aquí
                    'id': _usuario.id,
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

