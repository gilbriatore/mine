import 'package:mobx/mobx.dart';
import '../models/afazer.dart';
import '../repositories/afazer_repository.dart';

//flutter pub run build_runner build
part 'afazer_store.g.dart';

class AfazerStore = _AfazerStore with _$AfazerStore;

abstract class _AfazerStore with Store {


  _AfazerStore(){
    carregarAfazeres();
  }

  AfazerRepository repository = AfazerRepository();

  @observable
  ObservableList<Afazer> listaDeAfazeres = ObservableList();

  @observable
  ObservableFuture<List<Afazer>> obsFuture = ObservableFuture.value([]);

  @computed
  bool get isCarregando{
    return obsFuture.status == FutureStatus.pending;
  }

  @action
  Future<void> carregarAfazeres() async {
    final futureList = repository.listarAfazeres();
    obsFuture = ObservableFuture(futureList);
    final afazeres = await futureList;
    listaDeAfazeres.addAll(afazeres);
  }

  @action
  Future<void> salvarAfazer(String titulo) async{
    final afazer = await repository.salvarAfazer(Afazer(titulo));
    if (afazer != null){
      listaDeAfazeres.add(afazer);
    }
  }
}