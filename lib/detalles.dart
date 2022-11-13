import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class detalle extends StatefulWidget {
  Map<String, dynamic> datos;
  detalle({super.key, required this.datos});

  @override
  State<detalle> createState() => _detalleState();
}

class _detalleState extends State<detalle> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.teal, Colors.blue])),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ),
          body: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                children: [
                 FadeInUpBig(
                   child: Container(
                      height: 400,
                      child: PhotoView(
                        imageProvider: AssetImage(widget.datos["imgs"][1]),
                        
                        minScale: PhotoViewComputedScale.contained * 0.8,
                        maxScale: PhotoViewComputedScale.covered * 2,
                      ),
                    ),
                 ),
                  Center(
                    child: FadeInUpBig(
                      duration: Duration(seconds: 3),
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        child: Text(widget.datos['descripcion']),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
