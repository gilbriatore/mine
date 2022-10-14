import 'package:mobx/mobx.dart';

//flutter pub run build_runner build
part 'afazer_store.g.dart';

class AfazerStore = _AfazerStore with _$AfazerStore;

abstract class _AfazerStore with Store {

  String id = '';

  @observable
  String titulo = '';

  @observable
  bool realizada = false;

}