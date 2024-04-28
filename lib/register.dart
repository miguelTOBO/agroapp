import 'package:flutter/material.dart';

class register extends StatelessWidget {
  const register({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(

            child:Column(

                children: [
                  Center(
                    child:Container(
                      margin:EdgeInsets.only(top:50),
                      height: 210,
                      width: 210,
                      child: Image.asset(
                          'imagenes/sena.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.center
                      ),
                    ),
                  ),
                  Container(
                      child:Text('Crea tu Cuenta',
                          style:TextStyle(
                            color: Color.fromARGB(255, 96, 150, 186),
                            fontSize:25,
                          )
                      )
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 60,
                    width: 300,
                    child:TextField(
                      controller: null,
                      decoration: InputDecoration(
                        filled:true,
                        fillColor: Color.fromARGB(217, 217, 217, 217),
                        labelText: 'Nombre Usuario',
                        prefixIcon:Icon(Icons.person),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(22)),
                          borderSide: BorderSide(color: Color.fromARGB(217, 217, 217, 217)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(22)),
                          borderSide: BorderSide(color: Color.fromARGB(217, 217, 217, 217)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 60,
                    width: 300,
                    child: TextField(
                      controller: null,
                      decoration: InputDecoration(
                          filled:true,
                          fillColor: Color.fromARGB(217, 217, 217, 217),
                          labelText: 'Email',
                          prefixIcon:Icon(Icons.email_sharp),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                            borderSide: BorderSide(color: Color.fromARGB(217, 217, 217, 217)),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                            borderSide: BorderSide(color: Color.fromARGB(217, 217, 217, 217)),
                          ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 60,
                    width: 300,
                    child: TextField(
                      controller: null,
                      decoration: InputDecoration(
                          filled:true,
                          fillColor: Color.fromARGB(217, 217, 217, 217),
                          labelText: 'Contraseña',
                          prefixIcon:Icon(Icons.lock),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                            borderSide: BorderSide(color: Color.fromARGB(217, 217, 217, 217)),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                            borderSide: BorderSide(color: Color.fromARGB(217, 217, 217, 217)),
                          ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 60,
                    width: 300,
                    child: TextField(
                      controller: null,
                      decoration: InputDecoration(
                          filled:true,
                          fillColor: Color.fromARGB(217, 217, 217, 217),
                          labelText: 'Confirmar Contraseña',
                          prefixIcon:Icon(Icons.lock),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                            borderSide: BorderSide(color: Color.fromARGB(217, 217, 217, 217)),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                            borderSide: BorderSide(color: Color.fromARGB(217, 217, 217, 217)),
                          ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  Container(
                      height: 50,
                      width: 300,
                      child:TextButton(onPressed: (){
                        print("Button pressed");
                      },
                        child: Text('Ingresar',
                          style: TextStyle(
                            color:Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        style:TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 96, 150, 186),
                        ),
                      )
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(35),
                        child: Icon(Icons.facebook,
                          size: 50,
                          color: Color.fromARGB(255, 96, 150, 186),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(35),
                        child: Icon(Icons.email,
                          size: 50,
                          color: Color.fromARGB(255, 96, 150, 186),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(35),
                        child: Icon(Icons.info_outline_rounded,
                          size: 50,
                            color: Color.fromARGB(255, 96, 150, 186),
                        ),
                      ),
                    ],
                  )
                ]
            )
        ),
      ),
    );
  }
}