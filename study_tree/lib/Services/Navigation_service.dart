// 各ページへの画面遷移のロジックを記述するファイル(どのページに遷移するのかのロジックを書く。)。

import 'package:flutter/material.dart';
import '../Pages/Project_page.dart';
import '../Pages/NewUserRegistration_page.dart';

class Navigation_service {
  Navigation_service._internal();

  static final Navigation_service _instance = Navigation_service._internal();

  factory Navigation_service() {
    return _instance;
  }

  // 新規ユーザー登録画面への遷移メソッド
  void navigateToNewUserRegisterRegistration_page(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NewUserResistration()),
    );
  }

  // ログイン画面への遷移メソッド
  void navigateToLogin_and_NewUserRegistration_page(BuildContext context) {
    Navigator.pop(context);
  }

  void navigateToProject_page(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Project_page()),
    );
  }
}
