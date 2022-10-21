// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'afazer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AfazerStore on _AfazerStore, Store {
  Computed<bool>? _$isCarregandoComputed;

  @override
  bool get isCarregando =>
      (_$isCarregandoComputed ??= Computed<bool>(() => super.isCarregando,
              name: '_AfazerStore.isCarregando'))
          .value;

  late final _$listaDeAfazeresAtom =
      Atom(name: '_AfazerStore.listaDeAfazeres', context: context);

  @override
  ObservableList<Afazer> get listaDeAfazeres {
    _$listaDeAfazeresAtom.reportRead();
    return super.listaDeAfazeres;
  }

  @override
  set listaDeAfazeres(ObservableList<Afazer> value) {
    _$listaDeAfazeresAtom.reportWrite(value, super.listaDeAfazeres, () {
      super.listaDeAfazeres = value;
    });
  }

  late final _$obsFutureAtom =
      Atom(name: '_AfazerStore.obsFuture', context: context);

  @override
  ObservableFuture<List<Afazer>> get obsFuture {
    _$obsFutureAtom.reportRead();
    return super.obsFuture;
  }

  @override
  set obsFuture(ObservableFuture<List<Afazer>> value) {
    _$obsFutureAtom.reportWrite(value, super.obsFuture, () {
      super.obsFuture = value;
    });
  }

  late final _$carregarAfazeresAsyncAction =
      AsyncAction('_AfazerStore.carregarAfazeres', context: context);

  @override
  Future<void> carregarAfazeres() {
    return _$carregarAfazeresAsyncAction.run(() => super.carregarAfazeres());
  }

  late final _$salvarAfazerAsyncAction =
      AsyncAction('_AfazerStore.salvarAfazer', context: context);

  @override
  Future<void> salvarAfazer(String titulo) {
    return _$salvarAfazerAsyncAction.run(() => super.salvarAfazer(titulo));
  }

  late final _$excluirAfazerAsyncAction =
      AsyncAction('_AfazerStore.excluirAfazer', context: context);

  @override
  Future<void> excluirAfazer(Afazer afazer) {
    return _$excluirAfazerAsyncAction.run(() => super.excluirAfazer(afazer));
  }

  @override
  String toString() {
    return '''
listaDeAfazeres: ${listaDeAfazeres},
obsFuture: ${obsFuture},
isCarregando: ${isCarregando}
    ''';
  }
}
