import 'package:flutter/material.dart';

class MetasPage extends StatefulWidget {
  const MetasPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MetasPage> createState() => _MetasPageState();
}

class _MetasPageState extends State<MetasPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            child: Card(
              color: Colors.amberAccent,
              child: InkWell(
                onTap: (){

                },
                child: Text(
                  'Meta 1',
                ),
              ),
            ),
          ),
          Container(
            height: 200,
            child: Card(
              color: Colors.amberAccent,
              child: InkWell(
                onTap: (){

                },
                child: Text(
                  'Meta 2',
                ),
              ),
            ),
          ),
          Container(
            height: 200,
            child: Card(
              color: Colors.amberAccent,
              child: InkWell(
                onTap: (){

                },
                child: Text(
                  'Meta 3',
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.blueGrey,
        child: Container(height: 40,),
      ),
    );
  }
}
