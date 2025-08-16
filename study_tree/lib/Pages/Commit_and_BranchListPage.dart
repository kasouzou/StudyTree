import 'package:flutter/material.dart';

// コミット＆ブランチ一覧
class Commit_BranchListPage extends StatelessWidget {
  const Commit_BranchListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 戻るボタン
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // ここにNavigator.pop()などのロジックを追加
            // ProjectListPag.dart(プロジェクト一覧画面に戻る)
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'コミットとブランチ一覧',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: DefaultTabController(
        length: 2, // タブの数
        child: Column(
          children: [
            // Commits / Branches タブ
            const TabBar(
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              tabs: [
                Tab(text: 'コミット'),
                Tab(text: 'ブランチ'),
              ],
            ),
            // リスト表示部分
            Expanded(
              child: TabBarView(
                children: [
                  // Commits タブのコンテンツ
                  _buildCommitsList(),
                  // Branches タブのコンテンツ（空のコンテナを仮置き）
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
      // 右下のフローティングアクションボタン
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ここにプロジェクト作成などのロジックを追加
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // コミットリストを構築するプライベートメソッド
  Widget _buildCommitsList() {
    // ダミーデータ
    final commits = [
      {
        'time': '2日前',
        'message': 'feat: Add user authentication',
        'author': '中島翔太',
        'imageUrl': 'https://placehold.co/100x100/A0E6FF/000000?text=Image',
      },
      {
        'time': '1週間前',
        'message': 'fix: Resolve issue with data loading',
        'author': 'オリビア・ニュートリノ・キャサリン',
        'imageUrl': 'https://placehold.co/100x100/FFE0A0/000000?text=Image',
      },
      {
        'time': '2週間前',
        'message': 'docs: Update API documentation',
        'author': '金 玄恩',
        'imageUrl': 'https://placehold.co/100x100/B0FFB0/000000?text=Image',
      },
    ];

    return ListView.builder(
      itemCount: commits.length,
      itemBuilder: (context, index) {
        final commit = commits[index];
        return _CommitCard(
          time: commit['time']!,
          message: commit['message']!,
          author: commit['author']!,
          imageUrl: commit['imageUrl']!,
        );
      },
    );
  }
}

// リストの各項目を構築するウィジェット（コミットカード）
class _CommitCard extends StatelessWidget {
  final String time;
  final String message;
  final String author;
  final String imageUrl;

  const _CommitCard({
    required this.time,
    required this.message,
    required this.author,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    author,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
