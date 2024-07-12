import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:splash/paginas/actualizar.dart';
import 'package:splash/iniciar_sesion.dart';
import 'package:splash/productos/editarProducto.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Cuenta extends StatefulWidget {
  @override
  State<Cuenta> createState() => _CuentaState();
}

class _CuentaState extends State<Cuenta> {
  late User _user;
  bool _isLoading = true;
  late QueryDocumentSnapshot _usuario;
  late QueryDocumentSnapshot producto;
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
                                      producto = snapshot.data!.docs[index];
                                      return Card(
                                        color: Colors.grey[100],
                                        margin: EdgeInsets.all(10),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
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
                                                Expanded(
                                                  child: Container(
                                                    child: Center(
                                                      child: Text(
                                                        '${producto['titulo']} - ${producto['categoria']}',
                                                        style: TextStyle(
                                                          fontFamily: 'Barlow',
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 17,
                                                          color: Color.fromARGB(255, 28, 62, 44),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.scatter_plot,
                                                    size: 25,
                                                    color: Color.fromARGB(255, 28, 62, 44),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 2,
                                              width: double.infinity,
                                              color: Color.fromARGB(255, 28, 62, 44),
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(8),
                                              child: Text(
                                                '${producto['descripcion']} - \$${producto['precio']}',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
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
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => EditarProducto(producto: {
                                                            ...producto.data() as Map<String, dynamic>, // Conversión necesaria aquí
                                                            'id': producto.id,
                                                          }),
                                                        ),
                                                      );
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
                                                      eliminarProducto(producto.id);
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
  void eliminarProducto(String productoId) async {
    bool confirmarEliminacion = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmar eliminación",
            style: TextStyle(
              fontSize: 20
          ),),
          content: Text("¿Estás seguro de que deseas eliminar este producto?"),
          actions: [
            TextButton(
              child: Text("Cancelar",
                style: TextStyle(
                  color: Color.fromARGB(255, 28, 62, 44)
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text("Eliminar",
                style: TextStyle(
                    color: Color.fromARGB(255, 28, 62, 44)
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    if (confirmarEliminacion) {
      try {
        await FirebaseFirestore.instance.collection('productos').doc(productoId).delete();
        Fluttertoast.showToast(msg: 'el producto se elimino con exito',
            toastLength: Toast.LENGTH_LONG
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al eliminar el producto: $e')),
        );
      }
    }
  }

}

