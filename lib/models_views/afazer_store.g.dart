// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'afazer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AfazerStore on _AfazerStore, Store {
  late final _$tituloAtom = Atom(name: '_AfazerStore.titulo', context: context);

  @override
  String get titulo {
    _$tituloAtom.reportRead();
    return super.titulo;
  }

  @override
  set titulo(String value) {
    _$tituloAtom.reportWrite(value, super.titulo, () {
      super.titulo = value;
    });
  }

  late final _$realizadaAtom =
      Atom(name: '_AfazerStore.realizada', context: context);

  @override
  bool get realizada {
    _$realizadaAtom.reportRead();
    return super.realizada;
  }

  @override
  set realizada(bool value) {
    _$realizadaAtom.reportWrite(value, super.realizada, () {
      super.realizada = value;
    });
  }

  @override
  String toString() {
    return '''
titulo: ${titulo},
realizada: ${realizada}
    ''';
  }
}
