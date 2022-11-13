import 'dart:convert';
import 'package:a6/detalles.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class principal extends StatefulWidget {
  const principal({super.key});

  @override
  State<principal> createState() => _principalState();
}

class _principalState extends State<principal> {
  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: appbarr(),
          ),
          backgroundColor: Color.fromARGB(255, 206, 204, 224),
          body: SafeArea(
            child: FutureBuilder(
              builder: (BuildContext context, snapshot) {
                var datos = jsonDecode(snapshot.data.toString());
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return GridView.builder(
                    primary: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: query.width > 400 ? 3 : 2),
                    itemCount: datos.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detalle(
                                        datos: datos[index],
                                      )));
                        },
                        child: ElasticInUp(
                          duration: Duration(seconds: 2),
                          child: Card(
                            borderOnForeground: true,
                            child: Column(
                              children: [
                                Image.asset(
                                  datos[index]['imgs'][0],
                                  height: 130,
                                ),
                                Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      datos[index]['name'],
                                      style: TextStyle(
                                          fontSize:
                                              query.width > 400 ? 21 : 18),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
              future: DefaultAssetBundle.of(context)
                  .loadString("assets/data/datos.json"),
            ),
          ),
        ),
      ),
    );
  }
}

class appbarr extends StatelessWidget {
  const appbarr({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal, Colors.blue],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "ROMS",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        String user = """
Nombre: 
Correo:
Rol: 
                          """;
                        return SlideInUp(
                          duration: Duration(milliseconds: 1000),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30)),
                            height: _size.height - 100,
                            child: AnimatedContainer(
                              duration: Duration(seconds: 2),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Colors.teal, Colors.blue],
                                ),
                              ),
                              child: Column(
                                children: [
                                  Flash(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 10),
                                      child: CircleAvatar(
                                          radius: 70,
                                          backgroundImage: AssetImage(
                                              'assets/img/images.jpeg'),
                                          backgroundColor: Colors.blue),
                                    ),
                                  ),
                                  FadeInUpBig(
                                    delay: Duration(milliseconds: 900),
                                    child: Text(
                                      user,
                                      style: TextStyle(color: Colors.white,fontSize:17,height: 2 ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                icon: Icon(Icons.menu),
                iconSize: 40,
                color: Colors.white),
          )
        ],
      ),
    );
  }
}
