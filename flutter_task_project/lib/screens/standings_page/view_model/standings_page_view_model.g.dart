// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standings_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StandingsPageViewModel on _StandingsPageViewModelBase, Store {
  final _$containerOpacityAtom =
      Atom(name: '_StandingsPageViewModelBase.containerOpacity');

  @override
  bool get containerOpacity {
    _$containerOpacityAtom.reportRead();
    return super.containerOpacity;
  }

  @override
  set containerOpacity(bool value) {
    _$containerOpacityAtom.reportWrite(value, super.containerOpacity, () {
      super.containerOpacity = value;
    });
  }

  final _$opacityOnAtom = Atom(name: '_StandingsPageViewModelBase.opacityOn');

  @override
  bool get opacityOn {
    _$opacityOnAtom.reportRead();
    return super.opacityOn;
  }

  @override
  set opacityOn(bool value) {
    _$opacityOnAtom.reportWrite(value, super.opacityOn, () {
      super.opacityOn = value;
    });
  }

  final _$_StandingsPageViewModelBaseActionController =
      ActionController(name: '_StandingsPageViewModelBase');

  @override
  void getOpacity() {
    final _$actionInfo = _$_StandingsPageViewModelBaseActionController
        .startAction(name: '_StandingsPageViewModelBase.getOpacity');
    try {
      return super.getOpacity();
    } finally {
      _$_StandingsPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeContainerOpacity() {
    final _$actionInfo =
        _$_StandingsPageViewModelBaseActionController.startAction(
            name: '_StandingsPageViewModelBase.changeContainerOpacity');
    try {
      return super.changeContainerOpacity();
    } finally {
      _$_StandingsPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
containerOpacity: ${containerOpacity},
opacityOn: ${opacityOn}
    ''';
  }
}
