import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mine/models_views/afazer_store.dart';

class AfazeresPage extends StatelessWidget {
  AfazeresPage({Key? key, required this.title}) : super(key: key);
  final String title;
  AfazerStore afazerStore = AfazerStore();
  final txtAfazerController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void adicionarAfazer() async {
      if (txtAfazerController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Informar afazer"),
          duration: Duration(seconds: 2),
        ));
        return;
      }
      afazerStore.salvarAfazer(txtAfazerController.text);
      txtAfazerController.clear();
      Navigator.pop(context, 'OK');
    }

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
              controller: txtAfazerController,
              decoration: const InputDecoration(
                  labelText: "Novo afazer",
                  labelStyle: TextStyle(color: Colors.blueAccent)),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancelar'),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  adicionarAfazer();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      ///Serve para atualizar a lista
      body: Observer(
        builder: (_){
          if (afazerStore.isCarregando){
              return const Center(
                child: SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator()),
              );
          }

          if (afazerStore.listaDeAfazeres.isEmpty){
            return const Center(
              child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Text("Nenhum item cadastrado!",
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),),
            );
          }
          return ListView.builder(
              padding: const EdgeInsets.only(top: 10.0),
              itemCount: afazerStore.listaDeAfazeres.length,
              itemBuilder: (context, index) {

                final afazer = afazerStore.listaDeAfazeres[index];

                ///Serve para atualizar o item
                return Observer(builder: (_){
                  return ListTile(
                    title: Text( afazer.titulo),
                    leading: CircleAvatar(
                      backgroundColor: afazer.realizada ? Colors.green : Colors.blue,
                      foregroundColor: Colors.white,
                      child: Icon(afazer.realizada ? Icons.check : Icons.error),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                            value: afazer.realizada,
                            onChanged: (value) async {
                              afazer.setSituacao(value!);
                              afazerStore.atualizarAfazer(afazer);
                            }),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.blue,
                          ),
                          onPressed: () async {
                            afazerStore.excluirAfazer(afazer);
                          },
                        )
                      ],
                    ),
                  );
                });
              },);
        }
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _showMyDialog,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.blueGrey,
        child: Container(
          height: 40,
        ),
      ),
    );
  }
}
