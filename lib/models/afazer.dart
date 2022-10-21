import 'package:mobx/mobx.dart';

//flutter pub run build_runner build
part 'afazer.g.dart';

class Afazer = _Afazer with _$Afazer;

abstract class _Afazer with Store {

  _Afazer(this.titulo);

  String id = '';
  String titulo = '';

  @observable
  bool realizada = false;

  @action
  setSituacao(bool situacao) {
    realizada = situacao;
  }
}