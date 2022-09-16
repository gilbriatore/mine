import 'package:flutter/material.dart';
import 'package:mine/afazeres.dart';

import 'gastos.dart';
import 'metas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mine',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'mine'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              color: Colors.amberAccent,
              child: InkWell(
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AfazeresPage(title: 'Afazeres'))
                  );
                },
                child: Text(
                  'Afazeres',
                ),
              ),
            ),
            Card(
              color: Colors.amberAccent,
              child: InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MetasPage(title: 'Metas'))
                  );
                },
                child: Text(
                  'Metas',
                ),
              ),
            ),
            Card(
              color: Colors.amberAccent,
              child: InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GastosPage(title: 'Gastos'))
                  );
                },
                child: Text(
                  'Gastos',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
