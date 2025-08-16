import 'package:flutter/material.dart';

// 新規プロジェクト作成画面
class CreateNewProjectPage extends StatefulWidget {
  const CreateNewProjectPage({super.key});

  @override
  State<CreateNewProjectPage> createState() => _NewProjectScreenState();
}

class _NewProjectScreenState extends State<CreateNewProjectPage> {
  // プロジェクト名と説明の入力内容を管理するためのコントローラー
  final TextEditingController _projectNameController = TextEditingController();
  final TextEditingController _projectDescriptionController =
      TextEditingController();

  @override
  void dispose() {
    // 画面が閉じられたときにコントローラーを解放する
    _projectNameController.dispose();
    _projectDescriptionController.dispose();
    super.dispose();
  }

  // 警告ダイアログを表示するメソッド
  Future<bool> _showDiscardDialog() async {
    return await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('編集を破棄しますか？'),
              content: const Text('入力した内容は保存されません。'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('いいえ'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('はい'),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 戻るボタン
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () async {
            // ダイアログを表示し、ユーザーの選択に応じて画面を戻る
            final shouldDiscard = await _showDiscardDialog();
            if (shouldDiscard) {
              Navigator.pop(context);
            }
          },
        ),
        title: const Text(
          'プロジェクトの新規作成',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // プロジェクト名入力フィールド
            TextField(
              controller: _projectNameController,
              decoration: InputDecoration(
                hintText: 'プロジェクトの名前',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // プロジェクト説明入力フィールド
            Expanded(
              child: TextField(
                controller: _projectDescriptionController,
                maxLines: null, // 無制限
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: 'プロジェクトの説明を書いてください。(書く書かないは自由です。)',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // キャンセルボタンと作成ボタン
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // キャンセルボタン
                OutlinedButton(
                  onPressed: () async {
                    // ここにキャンセルロジック（Navigator.pop）を追加
                    final shouldDiscard = await _showDiscardDialog();
                    if (shouldDiscard) {
                      Navigator.pop(context);
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: const Text('キャンセル'),
                ),
                const SizedBox(width: 16),
                // 作成ボタン
                ElevatedButton(
                  onPressed: () {
                    // ここにプロジェクト作成ロジックを追加
                    final projectName = _projectNameController.text;
                    final projectDescription =
                        _projectDescriptionController.text;
                    // TODO: プロジェクト名と説明をデータベースなどに保存するロジック
                    print('Project Name: $projectName');
                    print('Project Description: $projectDescription');

                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    '作成',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
