// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixture_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FixturePageViewModel on _FixturePageViewModelBase, Store {
  final _$footerTextAtom = Atom(name: '_FixturePageViewModelBase.footerText');

  @override
  String get footerText {
    _$footerTextAtom.reportRead();
    return super.footerText;
  }

  @override
  set footerText(String value) {
    _$footerTextAtom.reportWrite(value, super.footerText, () {
      super.footerText = value;
    });
  }

  final _$containerOpacityAtom =
      Atom(name: '_FixturePageViewModelBase.containerOpacity');

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

  final _$_FixturePageViewModelBaseActionController =
      ActionController(name: '_FixturePageViewModelBase');

  @override
  void changeIndex(int index) {
    final _$actionInfo = _$_FixturePageViewModelBaseActionController
        .startAction(name: '_FixturePageViewModelBase.changeIndex');
    try {
      return super.changeIndex(index);
    } finally {
      _$_FixturePageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getOpacity() {
    final _$actionInfo = _$_FixturePageViewModelBaseActionController
        .startAction(name: '_FixturePageViewModelBase.getOpacity');
    try {
      return super.getOpacity();
    } finally {
      _$_FixturePageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeContainerOpacity() {
    final _$actionInfo = _$_FixturePageViewModelBaseActionController
        .startAction(name: '_FixturePageViewModelBase.changeContainerOpacity');
    try {
      return super.changeContainerOpacity();
    } finally {
      _$_FixturePageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
footerText: ${footerText},
containerOpacity: ${containerOpacity}
    ''';
  }
}
