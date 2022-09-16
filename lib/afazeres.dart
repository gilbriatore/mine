import 'package:flutter/material.dart';

class AfazeresPage extends StatefulWidget {
  const AfazeresPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AfazeresPage> createState() => _AfazeresPageState();
}

class _AfazeresPageState extends State<AfazeresPage> {
  int _counter = 0;

  void _incluirAfazer() {
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
            ListTile(
              onTap: (){
                print('item clicado 1');
              },
              leading: Icon(Icons.check_box),
              title: Text('Afazer 1'),
              subtitle: Text('sub 1'),
            ),
            ListTile(
              onTap: (){
                print('item clicado 2');
              },
              leading: Icon(Icons.check_box),
              title: Text('Afazer 2'),
              subtitle: Text('sub 2'),
            ),
            ListTile(
              onTap: (){
                print('item clicado 3');
              },
              leading: Icon(Icons.check_box),
              title: Text('Afazer 3'),
              subtitle: Text('sub 3'),
            ),
            ListTile(
              onTap: (){
                print('item clicado 4');
              },
              leading: Icon(Icons.check_box),
              title: Text('Afazer 4'),
              subtitle: Text('sub 4'),
            ),
            ListTile(
              onTap: (){
                print('item clicado 5');
              },
              leading: Icon(Icons.check_box),
              title: Text('Afazer 5'),
              subtitle: Text('sub 5'),
            ),
          ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _incluirAfazer,
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
