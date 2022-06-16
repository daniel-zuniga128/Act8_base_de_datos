import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zuniga/datos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro de Usuarios',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Registro de Usuarios'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var name, tel, fecha, municipio, email, password;
  create() async {
    DocumentReference documentReference = await FirebaseFirestore.instance.collection("Registro").add({
      'Nombre': name,
      'Telefono': tel,
      'Fecha': fecha,
      'Municipio': municipio,
      'Email': email,
      'Contraseña': password,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
        ),
        title: Text(
          'Registrarse',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: TextField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color(0xFF757575)),
                  hintText: 'Nombre',
                  filled: true,
                  fillColor: Color(0xFFBFBEBE),
                ),
                onChanged: (x) {
                  setState(() {
                    name = x;
                  });
                },
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
              child: TextField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color(0xFF757575)),
                  hintText: 'Telefono',
                  filled: true,
                  fillColor: Color(0xFFBFBEBE),
                ),
                onChanged: (x) {
                  setState(() {
                    tel = x;
                  });
                },
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
              child: TextField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color(0xFF757575)),
                  hintText: 'Fecha de nacimiento DD/MM/AA',
                  filled: true,
                  fillColor: Color(0xFFBFBEBE),
                ),
                onChanged: (x) {
                  setState(() {
                    fecha = x;
                  });
                },
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
              child: TextField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color(0xFF757575)),
                  hintText: 'Municipio',
                  filled: true,
                  fillColor: Color(0xFFBFBEBE),
                ),
                onChanged: (x) {
                  setState(() {
                    municipio = x;
                  });
                },
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
              child: TextField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color(0xFF757575)),
                  hintText: 'Email',
                  filled: true,
                  fillColor: Color(0xFFBFBEBE),
                ),
                onChanged: (x) {
                  setState(() {
                    email = x;
                  });
                },
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color(0xFF757575)),
                  hintText: 'Contraseña',
                  filled: true,
                  fillColor: Color(0xFFBFBEBE),
                ),
                onChanged: (x) {
                  setState(() {
                    password = x;
                  });
                },
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                padding: EdgeInsetsDirectional.fromSTEB(70, 10, 70, 10),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Color(0xFFF44336),
                    onSurface: Colors.grey,
                  ),
                  onPressed: () {
                    create();
                  },
                  child: const Text('Crear cuenta'),
                )),
            Container(
              padding: EdgeInsetsDirectional.fromSTEB(70, 10, 70, 10),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Color(0xFF2196F3),
                  onSurface: Colors.grey,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Datos()),
                  );
                },
                child: const Text('Consultar Datos'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
