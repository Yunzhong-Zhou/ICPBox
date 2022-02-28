// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `ICPBox`
  String get appName {
    return Intl.message(
      'ICPBox',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get tab1 {
    return Intl.message(
      'Wallet',
      name: 'tab1',
      desc: '',
      args: [],
    );
  }

  /// `DAPP`
  String get tab2 {
    return Intl.message(
      'DAPP',
      name: 'tab2',
      desc: '',
      args: [],
    );
  }

  /// `Infomation`
  String get tab3 {
    return Intl.message(
      'Infomation',
      name: 'tab3',
      desc: '',
      args: [],
    );
  }

  /// `Mine`
  String get tab4 {
    return Intl.message(
      'Mine',
      name: 'tab4',
      desc: '',
      args: [],
    );
  }

  /// `Pull to refresh`
  String get pullToRefresh {
    return Intl.message(
      'Pull to refresh',
      name: 'pullToRefresh',
      desc: '',
      args: [],
    );
  }

  /// `Release to refresh`
  String get releaseToRefresh {
    return Intl.message(
      'Release to refresh',
      name: 'releaseToRefresh',
      desc: '',
      args: [],
    );
  }

  /// `Refreshing...`
  String get refreshing {
    return Intl.message(
      'Refreshing...',
      name: 'refreshing',
      desc: '',
      args: [],
    );
  }

  /// `Refresh completed`
  String get refreshed {
    return Intl.message(
      'Refresh completed',
      name: 'refreshed',
      desc: '',
      args: [],
    );
  }

  /// `Refresh failed`
  String get refreshFailed {
    return Intl.message(
      'Refresh failed',
      name: 'refreshFailed',
      desc: '',
      args: [],
    );
  }

  /// `No more`
  String get noMore {
    return Intl.message(
      'No more',
      name: 'noMore',
      desc: '',
      args: [],
    );
  }

  /// `Update at %T`
  String get updateAt {
    return Intl.message(
      'Update at %T',
      name: 'updateAt',
      desc: '',
      args: [],
    );
  }

  /// `Pull to load`
  String get pushToLoad {
    return Intl.message(
      'Pull to load',
      name: 'pushToLoad',
      desc: '',
      args: [],
    );
  }

  /// `Pull to load`
  String get releaseToLoad {
    return Intl.message(
      'Pull to load',
      name: 'releaseToLoad',
      desc: '',
      args: [],
    );
  }

  /// `Pull to load`
  String get loading {
    return Intl.message(
      'Pull to load',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Pull to load`
  String get loaded {
    return Intl.message(
      'Pull to load',
      name: 'loaded',
      desc: '',
      args: [],
    );
  }

  /// `Pull to load`
  String get loadFailed {
    return Intl.message(
      'Pull to load',
      name: 'loadFailed',
      desc: '',
      args: [],
    );
  }

  /// `正在获取数据...`
  String get loading2 {
    return Intl.message(
      '正在获取数据...',
      name: 'loading2',
      desc: '',
      args: [],
    );
  }

  /// `正在提交数据...`
  String get loading3 {
    return Intl.message(
      '正在提交数据...',
      name: 'loading3',
      desc: '',
      args: [],
    );
  }

  /// `重新加载`
  String get reLoad {
    return Intl.message(
      '重新加载',
      name: 'reLoad',
      desc: '',
      args: [],
    );
  }

  /// `暂无数据`
  String get noData {
    return Intl.message(
      '暂无数据',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `跳过`
  String get jumpover {
    return Intl.message(
      '跳过',
      name: 'jumpover',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Copy Successfully`
  String get copysuccess {
    return Intl.message(
      'Copy Successfully',
      name: 'copysuccess',
      desc: '',
      args: [],
    );
  }

  /// `Enter search content`
  String get sreachinfo {
    return Intl.message(
      'Enter search content',
      name: 'sreachinfo',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Hint`
  String get hint {
    return Intl.message(
      'Hint',
      name: 'hint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm add?`
  String get hint1 {
    return Intl.message(
      'Confirm add?',
      name: 'hint1',
      desc: '',
      args: [],
    );
  }

  /// `Confirm delete?`
  String get hint2 {
    return Intl.message(
      'Confirm delete?',
      name: 'hint2',
      desc: '',
      args: [],
    );
  }

  /// `Confirm modify?`
  String get hint3 {
    return Intl.message(
      'Confirm modify?',
      name: 'hint3',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get wallet1 {
    return Intl.message(
      '',
      name: 'wallet1',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get wallet2 {
    return Intl.message(
      '',
      name: 'wallet2',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get wallet3 {
    return Intl.message(
      '',
      name: 'wallet3',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get wallet4 {
    return Intl.message(
      '',
      name: 'wallet4',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get wallet5 {
    return Intl.message(
      '',
      name: 'wallet5',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get wallet6 {
    return Intl.message(
      '',
      name: 'wallet6',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get wallet7 {
    return Intl.message(
      '',
      name: 'wallet7',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get wallet8 {
    return Intl.message(
      '',
      name: 'wallet8',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get wallet9 {
    return Intl.message(
      '',
      name: 'wallet9',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get wallet10 {
    return Intl.message(
      '',
      name: 'wallet10',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get wallet11 {
    return Intl.message(
      '',
      name: 'wallet11',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get wallet12 {
    return Intl.message(
      '',
      name: 'wallet12',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get wallet13 {
    return Intl.message(
      '',
      name: 'wallet13',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get wallet14 {
    return Intl.message(
      '',
      name: 'wallet14',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get wallet15 {
    return Intl.message(
      '',
      name: 'wallet15',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get wallet16 {
    return Intl.message(
      '',
      name: 'wallet16',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get wallet17 {
    return Intl.message(
      '',
      name: 'wallet17',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get wallet18 {
    return Intl.message(
      '',
      name: 'wallet18',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get wallet19 {
    return Intl.message(
      '',
      name: 'wallet19',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get wallet20 {
    return Intl.message(
      '',
      name: 'wallet20',
      desc: '',
      args: [],
    );
  }

  /// `热点项目`
  String get dapp1 {
    return Intl.message(
      '热点项目',
      name: 'dapp1',
      desc: '',
      args: [],
    );
  }

  /// `最新项目`
  String get dapp2 {
    return Intl.message(
      '最新项目',
      name: 'dapp2',
      desc: '',
      args: [],
    );
  }

  /// `申请人`
  String get dapp3 {
    return Intl.message(
      '申请人',
      name: 'dapp3',
      desc: '',
      args: [],
    );
  }

  /// `团队`
  String get dapp4 {
    return Intl.message(
      '团队',
      name: 'dapp4',
      desc: '',
      args: [],
    );
  }

  /// `申请人信息`
  String get dapp5 {
    return Intl.message(
      '申请人信息',
      name: 'dapp5',
      desc: '',
      args: [],
    );
  }

  /// `申请人姓名`
  String get dapp6 {
    return Intl.message(
      '申请人姓名',
      name: 'dapp6',
      desc: '',
      args: [],
    );
  }

  /// `请填写申请人姓名`
  String get dapp7 {
    return Intl.message(
      '请填写申请人姓名',
      name: 'dapp7',
      desc: '',
      args: [],
    );
  }

  /// `邮箱`
  String get dapp8 {
    return Intl.message(
      '邮箱',
      name: 'dapp8',
      desc: '',
      args: [],
    );
  }

  /// `请填写邮箱地址`
  String get dapp9 {
    return Intl.message(
      '请填写邮箱地址',
      name: 'dapp9',
      desc: '',
      args: [],
    );
  }

  /// `联系电话`
  String get dapp10 {
    return Intl.message(
      '联系电话',
      name: 'dapp10',
      desc: '',
      args: [],
    );
  }

  /// `请填写联系电话`
  String get dapp11 {
    return Intl.message(
      '请填写联系电话',
      name: 'dapp11',
      desc: '',
      args: [],
    );
  }

  /// `DAPP信息`
  String get dapp12 {
    return Intl.message(
      'DAPP信息',
      name: 'dapp12',
      desc: '',
      args: [],
    );
  }

  /// `DAPP名称`
  String get dapp13 {
    return Intl.message(
      'DAPP名称',
      name: 'dapp13',
      desc: '',
      args: [],
    );
  }

  /// `请填写申请人姓名`
  String get dapp14 {
    return Intl.message(
      '请填写申请人姓名',
      name: 'dapp14',
      desc: '',
      args: [],
    );
  }

  /// `DAPP图片`
  String get dapp15 {
    return Intl.message(
      'DAPP图片',
      name: 'dapp15',
      desc: '',
      args: [],
    );
  }

  /// `DAPP链接地址`
  String get dapp16 {
    return Intl.message(
      'DAPP链接地址',
      name: 'dapp16',
      desc: '',
      args: [],
    );
  }

  /// `请填写链接地址`
  String get dapp17 {
    return Intl.message(
      '请填写链接地址',
      name: 'dapp17',
      desc: '',
      args: [],
    );
  }

  /// `DAPP合约地址`
  String get dapp18 {
    return Intl.message(
      'DAPP合约地址',
      name: 'dapp18',
      desc: '',
      args: [],
    );
  }

  /// `请填写合约地址`
  String get dapp19 {
    return Intl.message(
      '请填写合约地址',
      name: 'dapp19',
      desc: '',
      args: [],
    );
  }

  /// `DAPP宣传语`
  String get dapp20 {
    return Intl.message(
      'DAPP宣传语',
      name: 'dapp20',
      desc: '',
      args: [],
    );
  }

  /// `请填写宣传语`
  String get dapp21 {
    return Intl.message(
      '请填写宣传语',
      name: 'dapp21',
      desc: '',
      args: [],
    );
  }

  /// `DAPP简介`
  String get dapp22 {
    return Intl.message(
      'DAPP简介',
      name: 'dapp22',
      desc: '',
      args: [],
    );
  }

  /// `请填写简介`
  String get dapp23 {
    return Intl.message(
      '请填写简介',
      name: 'dapp23',
      desc: '',
      args: [],
    );
  }

  /// `团队信息`
  String get dapp24 {
    return Intl.message(
      '团队信息',
      name: 'dapp24',
      desc: '',
      args: [],
    );
  }

  /// `团队简介`
  String get dapp25 {
    return Intl.message(
      '团队简介',
      name: 'dapp25',
      desc: '',
      args: [],
    );
  }

  /// `请填写团队简介`
  String get dapp26 {
    return Intl.message(
      '请填写团队简介',
      name: 'dapp26',
      desc: '',
      args: [],
    );
  }

  /// `社群信息`
  String get dapp27 {
    return Intl.message(
      '社群信息',
      name: 'dapp27',
      desc: '',
      args: [],
    );
  }

  /// `其他合作钱包`
  String get dapp28 {
    return Intl.message(
      '其他合作钱包',
      name: 'dapp28',
      desc: '',
      args: [],
    );
  }

  /// `该DApp其他合作钱包，多个请用；隔开`
  String get dapp29 {
    return Intl.message(
      '该DApp其他合作钱包，多个请用；隔开',
      name: 'dapp29',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get dapp30 {
    return Intl.message(
      '',
      name: 'dapp30',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get dapp31 {
    return Intl.message(
      '',
      name: 'dapp31',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get dapp32 {
    return Intl.message(
      '',
      name: 'dapp32',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get dapp33 {
    return Intl.message(
      '',
      name: 'dapp33',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get dapp34 {
    return Intl.message(
      '',
      name: 'dapp34',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get dapp35 {
    return Intl.message(
      '',
      name: 'dapp35',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get dapp36 {
    return Intl.message(
      '',
      name: 'dapp36',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get dapp37 {
    return Intl.message(
      '',
      name: 'dapp37',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get dapp38 {
    return Intl.message(
      '',
      name: 'dapp38',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get dapp39 {
    return Intl.message(
      '',
      name: 'dapp39',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get dapp40 {
    return Intl.message(
      '',
      name: 'dapp40',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get infomation1 {
    return Intl.message(
      '',
      name: 'infomation1',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get infomation2 {
    return Intl.message(
      '',
      name: 'infomation2',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get infomation3 {
    return Intl.message(
      '',
      name: 'infomation3',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get infomation4 {
    return Intl.message(
      '',
      name: 'infomation4',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get infomation5 {
    return Intl.message(
      '',
      name: 'infomation5',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get infomation6 {
    return Intl.message(
      '',
      name: 'infomation6',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get infomation7 {
    return Intl.message(
      '',
      name: 'infomation7',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get infomation8 {
    return Intl.message(
      '',
      name: 'infomation8',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get infomation9 {
    return Intl.message(
      '',
      name: 'infomation9',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get infomation10 {
    return Intl.message(
      '',
      name: 'infomation10',
      desc: '',
      args: [],
    );
  }

  /// `我的`
  String get mine1 {
    return Intl.message(
      '我的',
      name: 'mine1',
      desc: '',
      args: [],
    );
  }

  /// `地址簿`
  String get mine2 {
    return Intl.message(
      '地址簿',
      name: 'mine2',
      desc: '',
      args: [],
    );
  }

  /// `通知公告`
  String get mine3 {
    return Intl.message(
      '通知公告',
      name: 'mine3',
      desc: '',
      args: [],
    );
  }

  /// `帮助中心`
  String get mine4 {
    return Intl.message(
      '帮助中心',
      name: 'mine4',
      desc: '',
      args: [],
    );
  }

  /// `分享钱包`
  String get mine5 {
    return Intl.message(
      '分享钱包',
      name: 'mine5',
      desc: '',
      args: [],
    );
  }

  /// `关于我们`
  String get mine6 {
    return Intl.message(
      '关于我们',
      name: 'mine6',
      desc: '',
      args: [],
    );
  }

  /// `语言设置`
  String get mine7 {
    return Intl.message(
      '语言设置',
      name: 'mine7',
      desc: '',
      args: [],
    );
  }

  /// `货币单位`
  String get mine8 {
    return Intl.message(
      '货币单位',
      name: 'mine8',
      desc: '',
      args: [],
    );
  }

  /// `官方推特`
  String get mine9 {
    return Intl.message(
      '官方推特',
      name: 'mine9',
      desc: '',
      args: [],
    );
  }

  /// `官方电报`
  String get mine10 {
    return Intl.message(
      '官方电报',
      name: 'mine10',
      desc: '',
      args: [],
    );
  }

  /// `官方邮箱`
  String get mine11 {
    return Intl.message(
      '官方邮箱',
      name: 'mine11',
      desc: '',
      args: [],
    );
  }

  /// `官方网站`
  String get mine12 {
    return Intl.message(
      '官方网站',
      name: 'mine12',
      desc: '',
      args: [],
    );
  }

  /// `检查更新`
  String get mine13 {
    return Intl.message(
      '检查更新',
      name: 'mine13',
      desc: '',
      args: [],
    );
  }

  /// `用户协议`
  String get mine14 {
    return Intl.message(
      '用户协议',
      name: 'mine14',
      desc: '',
      args: [],
    );
  }

  /// `暂无地址簿`
  String get mine15 {
    return Intl.message(
      '暂无地址簿',
      name: 'mine15',
      desc: '',
      args: [],
    );
  }

  /// `添加地址薄`
  String get mine16 {
    return Intl.message(
      '添加地址薄',
      name: 'mine16',
      desc: '',
      args: [],
    );
  }

  /// `名称`
  String get mine17 {
    return Intl.message(
      '名称',
      name: 'mine17',
      desc: '',
      args: [],
    );
  }

  /// `地址`
  String get mine18 {
    return Intl.message(
      '地址',
      name: 'mine18',
      desc: '',
      args: [],
    );
  }

  /// `备注(可选)`
  String get mine19 {
    return Intl.message(
      '备注(可选)',
      name: 'mine19',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get mine20 {
    return Intl.message(
      '',
      name: 'mine20',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get mine21 {
    return Intl.message(
      '',
      name: 'mine21',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get mine22 {
    return Intl.message(
      '',
      name: 'mine22',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get mine23 {
    return Intl.message(
      '',
      name: 'mine23',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get mine24 {
    return Intl.message(
      '',
      name: 'mine24',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get mine25 {
    return Intl.message(
      '',
      name: 'mine25',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get mine26 {
    return Intl.message(
      '',
      name: 'mine26',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get mine27 {
    return Intl.message(
      '',
      name: 'mine27',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get mine28 {
    return Intl.message(
      '',
      name: 'mine28',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get mine29 {
    return Intl.message(
      '',
      name: 'mine29',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get mine30 {
    return Intl.message(
      '',
      name: 'mine30',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
