//　※このクラスのファイル名について、SplashScreenがアプリ起動時に一瞬だけ表示される機能そのものの名前なので、意味が重複するが、SplashScreenPageとし、SplashScreenは一つの塊としてみて、SplashScreenという機能を提供するPageであることをここに強く宣言しておく。わかりにくくてごめん♡

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // SystemChromeを使うために必要

// ダミーの次画面として、以前作成したProjectsScreenをインポート
import 'Login_and_NewUserRegistrationPage.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    // アプリの起動時に画面が自動で次に遷移するよう設定
    _navigateToNextScreen();
  }

  // 画面遷移ロジック
  _navigateToNextScreen() async {
    // 3秒間待機
    await Future.delayed(const Duration(seconds: 2));
    // 次の画面へ遷移
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Login_and_NewUserRegistrationPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // スプラッシュ画面のステータスバーとナビゲーションバーを非表示にする
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
      // スプラッシュ画面の背景色
      backgroundColor: Colors.green, // LINEのテーマカラー
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ロゴ画像を表示
            Image.network(
              'https://placehold.co/150x150/00FF00/FFFFFF?text=Logo', // ダミーのロゴ画像URL
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            // ロゴの下にテキストを表示
            const Text(
              'StudyTree',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
