import 'package:flutter/material.dart';

import '../models/afazer.dart';
import '../repositories/afazer_repository.dart';

class AfazeresPage extends StatefulWidget {
  const AfazeresPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AfazeresPage> createState() => _AfazeresPageState();
}



class _AfazeresPageState extends State<AfazeresPage> {
  final todoController = TextEditingController();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Incluir afazer'),
          content: TextField(
            autocorrect: true,
            textCapitalization: TextCapitalization.sentences,
            controller: todoController,
            decoration: InputDecoration(
                labelText: "Novo afazer",
                labelStyle: TextStyle(color: Colors.blueAccent)),
          ),
          actions:  <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancelar'),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () => {
                addToDo()
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  AfazerRepository repository = AfazerRepository();

  void addToDo() async {
    if (todoController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Empty title"),
        duration: Duration(seconds: 2),
      ));
      return;
    }
    await repository.saveTodo(todoController.text);
    setState(() {
      todoController.clear();
    });
    Navigator.pop(context, 'OK');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          child: FutureBuilder<List<Afazer>>(
              future: repository.listarAfazeres(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                      child: Container(
                          width: 100,
                          height: 100,
                          child: CircularProgressIndicator()),
                    );
                  default:
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error..."),
                      );
                    }
                    if (!snapshot.hasData) {
                      return Center(
                        child: Text("No Data..."),
                      );
                    } else {
                      return ListView.builder(
                          padding: EdgeInsets.only(top: 10.0),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            //*************************************
                            //Get Parse Object Values
                            final afazer = snapshot.data![index];
                            final varTitle = afazer.titulo;
                            final varDone =  afazer.realizada;
                            //*************************************

                            return ListTile(
                              title: Text(varTitle),
                              leading: CircleAvatar(
                                child: Icon(
                                    varDone ? Icons.check : Icons.error),
                                backgroundColor:
                                varDone ? Colors.green : Colors.blue,
                                foregroundColor: Colors.white,
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(
                                      value: varDone,
                                      onChanged: (value) async {
                                        await repository.updateTodo(
                                            afazer.id, value!);
                                        setState(() {
                                          //Refresh UI
                                        });
                                      }),
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.blue,
                                    ),
                                    onPressed: () async {
                                      await repository.deleteTodo(afazer.id);
                                      setState(() {
                                        final snackBar = SnackBar(
                                          content: Text("Todo deleted!"),
                                          duration: Duration(seconds: 2),
                                        );
                                        ScaffoldMessenger.of(context)
                                          ..removeCurrentSnackBar()
                                          ..showSnackBar(snackBar);
                                      });
                                    },
                                  )
                                ],
                              ),
                            );
                          });
                    }
                }
              }))

      // ListView(
      //     children: [
      //       ListTile(
      //         onTap: (){
      //           print('item clicado 1');
      //         },
      //         leading: Icon(Icons.check_box),
      //         title: Text('Afazer 1'),
      //         subtitle: Text('sub 1'),
      //       ),
      //       ListTile(
      //         onTap: (){
      //           print('item clicado 2');
      //         },
      //         leading: Icon(Icons.check_box),
      //         title: Text('Afazer 2'),
      //         subtitle: Text('sub 2'),
      //       ),
      //       ListTile(
      //         onTap: (){
      //           print('item clicado 3');
      //         },
      //         leading: Icon(Icons.check_box),
      //         title: Text('Afazer 3'),
      //         subtitle: Text('sub 3'),
      //       ),
      //       ListTile(
      //         onTap: (){
      //           print('item clicado 4');
      //         },
      //         leading: Icon(Icons.check_box),
      //         title: Text('Afazer 4'),
      //         subtitle: Text('sub 4'),
      //       ),
      //       ListTile(
      //         onTap: (){
      //           print('item clicado 5');
      //         },
      //         leading: Icon(Icons.check_box),
      //         title: Text('Afazer 5'),
      //         subtitle: Text('sub 5'),
      //       ),
      //     ],
      // )
      ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _showMyDialog,
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



