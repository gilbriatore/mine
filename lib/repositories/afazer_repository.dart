import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../models/afazer.dart';

class AfazerRepository {

   //CRUD
  Future<void> saveTodo(String title) async {
    final todo = ParseObject('Afazer')
      ..set('title', title)
      ..set('done', false);
    await todo.save();
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
        Afazer afazer = Afazer();
        afazer.id = id!;
        afazer.titulo = titulo;
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