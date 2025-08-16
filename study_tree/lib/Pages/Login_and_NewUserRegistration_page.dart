import 'package:flutter/material.dart';
import '../ReuseableWidget/CustomInputField.dart';
import '../ReuseableWidget/PrimaryButton.dart';
import '../Services/Navigation_service.dart';

class Login_and_NewUserRegistration_page extends StatelessWidget {
  // 後でコントローラやロジックを渡せるように、コンストラクタに追加
  // final void Function() onLoginPressed;
  // const LoginAndSignupView({
  //   super.key,
  //   required this.onLoginPressed,
  //   required this.onSignupPressed,
  // });

  const Login_and_NewUserRegistration_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン'),
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
            // "おかえりなさい" テキスト
            Text(
              'おかえりなさい',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
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
            const SizedBox(height: 8),
            // パスワードを忘れた場合のテキスト
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // パスワードリセットのロジックを後で追加
                },
                child: const Text(
                  'パスワードを忘れた場合はこちら',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // ログインボタン
            PrimaryButton(
              text: 'ログイン',
              onPressed: () {
                // ログインロジックを後で追加
                // onLoginPressed();
              },
            ),
            const SizedBox(height: 24),
            // 新規ユーザー登録ボタン
            OutlinedButton(
              onPressed: () {
                // 新規登録画面への遷移ロジックを後で追加
                Navigation_service().navigateToNewUserRegisterRegistration_page(
                  context,
                );
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide.none, // アウトラインを非表示に
              ),
              child: const Text(
                '新規ユーザー登録',
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
