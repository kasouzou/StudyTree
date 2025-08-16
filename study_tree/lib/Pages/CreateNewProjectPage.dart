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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 戻るボタン
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            // ここに画面を閉じるロジック（Navigator.pop）を追加
            // プロジェクト一覧(ProjectListPage.dart)に戻る。
            Navigator.pop(context);
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
                  onPressed: () {
                    // ここにキャンセルロジック（Navigator.pop）を追加とある
                    // が、キャンセルダイアログ出してから
                    // プロジェクト一覧(ProjectListPage.dart)
                    // に戻った方がいいかも。
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
                  child: const Text('Cancel'),
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
                    'Create',
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
