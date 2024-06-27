import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:splash/iniciar_sesion.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  List<String> categorias = [
    'Granos',
    'Frutas',
    'Verduras',
    'Fertilizantes',
    'Herramientas',
  ];
  int current = 0;
  bool _isSearching = false;
  List _allresults = [];
  List _results = [];
  final TextEditingController _busquedaController = TextEditingController();

  List<Widget> secciones = [
    PrimeraSeccion(),
    SegundaSeccion(),
    TerceraSeccion(),
    CuartaSeccion(),
    QuintaSeccion(),
  ];
  void cerrarSesion()async{
    await FirebaseAuth.instance.signOut();
    Navigator.push(context,
      MaterialPageRoute(
        builder: (context) => listados(),
      ),
    );
  }
  @override
  void initState() {
    getProductosStream();
    _busquedaController.addListener(_onSearchChange);
    super.initState();
  }

  _onSearchChange() {
    searchResults();
  }

  searchResults() {
    var showResults = [];
    if (_busquedaController.text != "") {
      for (var produSnapShot in _allresults) {
        var titulo = produSnapShot['titulo'].toString().toLowerCase();
        if (titulo.contains(_busquedaController.text.toLowerCase())) {
          showResults.add(produSnapShot);
        }
      }
    } else {
      showResults = List.from(_allresults);
    }

    setState(() {
      _results = showResults;
    });
  }

  getProductosStream() async {
    var data = await FirebaseFirestore.instance.collection('productos').orderBy('titulo').get();
    setState(() {
      _allresults = data.docs;
      _results = List.from(_allresults);
    });
  }

  @override
  void dispose() {
    _busquedaController.removeListener(_onSearchChange);
    _busquedaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 28, 62, 44),
        title: _isSearching
            ? Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.symmetric(horizontal: 13),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                ),
              ],
            ),
            child: TextField(
              controller: _busquedaController,
              decoration: InputDecoration(
                  hintText: 'Buscar...',
                  border: InputBorder.none
              ),
              style: TextStyle(
                fontFamily: 'Barlow',
                color: Color.fromARGB(255, 28, 62, 44),
              ),
            ),
          )
            : Row(
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
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _busquedaController.clear();
                }
              });
            },
            icon: Icon(
              _isSearching ? Icons.close : Icons.search,
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
          _isSearching
              ? Expanded(
            child: ListView.builder(
              itemCount: _results.length,
              itemBuilder: (context, index) {
                var producto = _results[index];
                return ListTile(
                  title: Column(
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
                        height: 320,
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
                              height: 125,
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
                            Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 58),
                              child: TextButton(
                                onPressed: () {
                                  _addToCart(context, producto);
                                },
                                child: Row(
                                    children: [
                                      Icon(Icons.add_shopping_cart,
                                          color: Colors.white,
                                          size: 20
                                      ),
                                      Padding(padding: EdgeInsets.all(5)),
                                      Text('Añadir al carrito',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      )
                                    ]
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 107, 187, 67),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ]
                  )
                );
              },
            ),
          )
              : Expanded(
            child: SingleChildScrollView(
              child: secciones[current],
            ),
          ),
        ],
      ),
    );
  }
}
void _addToCart(BuildContext context, DocumentSnapshot producto) async {
  final user = FirebaseAuth.instance.currentUser;
  final cartRef = FirebaseFirestore.instance.collection('carrito').doc(user!.uid).collection('items');

  await cartRef.doc(producto.id).set({
    'titulo': producto['titulo'],
    'descripcion': producto['descripcion'],
    'precio': producto['precio'],
    'imagen': producto['imagen'],
    'cantidad': 1,
  });

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Producto añadido al carrito')),
  );
}

class PrimeraSeccion extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('productos').where('categoria', isEqualTo: 'Granos').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var producto = snapshot.data!.docs[index];
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
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          child: Image.asset(
                            'imagenes/persona.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Center(
                            child: Text(
                              'User065416515',
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
                      '${producto['descripcion']} - ${producto['titulo']}',
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
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 58),
                    child: TextButton(
                      onPressed: () {
                        _addToCart(context, producto);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                            size: 22,
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          Text(
                            'Añadir al carrito',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 107, 187, 67),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class SegundaSeccion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('productos').where('categoria', isEqualTo: 'Frutas').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var producto = snapshot.data!.docs[index];
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
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          child: Image.asset(
                            'imagenes/persona.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Center(
                            child: Text(
                              'User065416515',
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
                      '${producto['descripcion']} - ${producto['titulo']}',
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
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 58),
                    child: TextButton(
                      onPressed: () {
                        _addToCart(context, producto);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                            size: 22,
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          Text(
                            'Añadir al carrito',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 107, 187, 67),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class TerceraSeccion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('productos').where('categoria', isEqualTo: 'Verduras').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var producto = snapshot.data!.docs[index];
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
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          child: Image.asset(
                            'imagenes/persona.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Center(
                            child: Text(
                              'User065416515',
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
                      '${producto['descripcion']} - ${producto['titulo']}',
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
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 58),
                    child: TextButton(
                      onPressed: () {
                        _addToCart(context, producto);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                            size: 22,
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          Text(
                            'Añadir al carrito',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 107, 187, 67),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class CuartaSeccion extends StatelessWidget {
  //const CuartaSeccion({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('productos').where('categoria', isEqualTo: 'Fertilizantes').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var producto = snapshot.data!.docs[index];
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
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          child: Image.asset(
                            'imagenes/persona.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Center(
                            child: Text(
                              'User065416515',
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
                      '${producto['descripcion']} - ${producto['titulo']}',
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
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 58),
                    child: TextButton(
                      onPressed: () {
                        _addToCart(context, producto);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                            size: 22,
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          Text(
                            'Añadir al carrito',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 107, 187, 67),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class QuintaSeccion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('productos').where('categoria', isEqualTo: 'Herramientas').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var producto = snapshot.data!.docs[index];
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
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 50,
                          width: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            child: Image.asset(
                              'imagenes/persona.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Center(
                              child: Text(
                                'User065416515',
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
                        '${producto['descripcion']} - ${producto['titulo']}',
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
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 58),
                      child: TextButton(
                        onPressed: () {
                          _addToCart(context, producto);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_shopping_cart,
                              color: Colors.white,
                              size: 22,
                            ),
                            Padding(padding: EdgeInsets.all(5)),
                            Text(
                              'Añadir al carrito',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 107, 187, 67),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
          },
        );
    }
}