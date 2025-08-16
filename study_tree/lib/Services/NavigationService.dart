// 各ページへの画面遷移のロジックを記述するファイル(どのページに遷移するのかのロジックを書く。)。

import 'package:flutter/material.dart';
import 'package:study_tree/Pages/CreateNewProjectPage.dart';
import '../Pages/Commit_and_BranchListPage.dart';
import '../Pages/NewUserRegistrationPage.dart';
import '../Pages/ProjectListPage.dart';

class NavigationService {
  NavigationService._internal();

  static final NavigationService _instance = NavigationService._internal();

  factory NavigationService() {
    return _instance;
  }

  // 新規ユーザー登録画面への遷移メソッド
  void navigateToNewUserRegistrationPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NewUserResistration()),
    );
  }

  // ログイン画面への遷移メソッド
  void navigateToLogin_and_NewUserRegistrationPage(BuildContext context) {
    Navigator.pop(context);
  }

  // コミットとブランチ一覧画面への遷移メソッド
  void navigateToCommitBranchListPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Commit_BranchListPage()),
    );
  }

  // プロジェクト一覧画面への遷移メソッド
  void navigateToProjectListPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProjectListPage()),
    );
  }

  // プロジェクト新規作成画面への遷移メソッド
  void navigateToCreateNewProjectPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreateNewProjectPage()),
    );
  }
}
