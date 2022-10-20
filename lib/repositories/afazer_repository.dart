import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../models/afazer.dart';

class AfazerRepository {

   //CRUD
  Future<Afazer?> salvarAfazer(Afazer afazer) async {
    final todo = ParseObject('Afazer')
      ..set('title', afazer.titulo)
      ..set('done', afazer.realizada);
    final ParseResponse response = await todo.save();
    if (response.success && response.result != null) {
      final object = response.result as ParseObject;
      afazer.id = object.objectId!;
      return afazer;
    }
    return null;
  }

  Future<List<Afazer>> listarAfazeres() async {
    QueryBuilder<ParseObject> queryTodo =
    QueryBuilder<ParseObject>(ParseObject('Afazer'));
    final ParseResponse apiResponse = await queryTodo.query();

    List<Afazer> lista = [];
    if (apiResponse.success && apiResponse.results != null) {
      final objects = apiResponse.results as List<ParseObject>;
      for (ParseObject object in objects){

        final id = object.objectId;
        final titulo = object.get<String>('title')!;
        final realizada =  object.get<bool>('done')!;
        Afazer afazer = Afazer(titulo);
        afazer.id = id!;
        afazer.realizada = realizada;
        lista.add(afazer);
      }
      return lista;
    } else {
      return [];
    }
  }

  Future<void> updateTodo(String id, bool done) async {
    var todo = ParseObject('Afazer')
      ..objectId = id
      ..set('done', done);
    await todo.save();
  }

  Future<void> deleteTodo(String id) async {
    var todo = ParseObject('Afazer')..objectId = id;
    await todo.delete();
  }


}