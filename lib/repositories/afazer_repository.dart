import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:mine/models/afazer.dart';

class AfazerRepository {

   //CRUD
  Future<Afazer?> salvarAfazer(Afazer afazer) async {
    final parser = ParseObject('Afazer')
      ..set('title', afazer.titulo)
      ..set('done', afazer.realizada);

    if (afazer.id.isNotEmpty){
      parser.objectId = afazer.id;
    }

    final ParseResponse response = await parser.save();
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

  Future<bool> excluirAfazer(Afazer afazer) async {
    var parse = ParseObject('Afazer')..objectId = afazer.id;
    final ParseResponse response = await parse.delete();
    if (response.success){
      return true;
    }
    return false;
  }
}