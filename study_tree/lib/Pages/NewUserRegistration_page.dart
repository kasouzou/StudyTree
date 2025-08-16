import 'package:flutter/material.dart';
import '../ReuseableWidget/CustomInputField.dart';
import '../ReuseableWidget/PrimaryButton.dart';
import '../Services/Navigation_service.dart';

class NewUserResistration extends StatelessWidget {
  const NewUserResistration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登録'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 48),
            // "Create your account" テキスト
            Text(
              '新規ユーザー登録',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            // ユーザー名入力フィールド
            const CustomInputField(
              hintText: 'ユーザーネーム',
              icon: Icons.person_outline,
            ),
            const SizedBox(height: 16),
            // メールアドレス入力フィールド
            const CustomInputField(
              hintText: 'メールアドレス',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            // パスワード入力フィールド
            const CustomInputField(
              hintText: 'パスワード',
              icon: Icons.lock_outline,
              obscureText: true,
            ),
            const SizedBox(height: 32),
            // 登録ボタン
            PrimaryButton(
              text: '登録',
              onPressed: () {
                // 新規ユーザー登録のロジックを後で追加
                Navigation_service().navigateToProject_page(context);
              },
            ),
            const SizedBox(height: 24),
            // ログインリンク
            OutlinedButton(
              onPressed: () {
                // ログイン画面への遷移ロジックを後で追加
                Navigation_service()
                    .navigateToLogin_and_NewUserRegistration_page(context);
                // 前の画面（ログイン画面）に戻る
              },
              style: OutlinedButton.styleFrom(side: BorderSide.none),
              child: const Text(
                'すでにアカウントをお持ちならこちらからログインできます。',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
