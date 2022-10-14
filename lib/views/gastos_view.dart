import 'package:flutter/material.dart';

class GastosPage extends StatefulWidget {
  const GastosPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<GastosPage> createState() => _GastosPageState();
}

class _GastosPageState extends State<GastosPage> {

  void _incluirGastos() {
    setState(() {
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
            title: Text('13/09/22 Gasto 1'),
            subtitle: Text('sub 1'),
          ),
          ListTile(
            onTap: (){
              print('item clicado 2');
            },
            title: Text('13/09/22 Gasto 2'),
            subtitle: Text('sub 2'),
          ),
          ListTile(
            onTap: (){
              print('item clicado 3');
            },
            title: Text('14/09/22 Gasto 3'),
            subtitle: Text('sub 3'),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _incluirGastos,
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
