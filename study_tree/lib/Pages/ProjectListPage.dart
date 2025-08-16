import 'package:flutter/material.dart';
import '../Services/NavigationService.dart';

// メインのプロジェクト一覧画面
class ProjectListPage extends StatelessWidget {
  const ProjectListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'プロジェクト一覧',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        // actions: [
        //   // 新規プロジェクト作成ボタン（AppBar内）
        //   IconButton(
        //     icon: const Icon(Icons.add, color: Colors.black),
        //     onPressed: () {
        //       // ここに新規プロジェクト作成画面への遷移ロジックを追加
        //     },
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // ウェルカムメッセージ
            const Text(
              'ようこそ○○←ユーザー名を表示',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // 新規プロジェクト作成ボタン
            ElevatedButton(
              onPressed: () {
                // ここに新規プロジェクト作成画面への遷移ロジックを追加
                NavigationService().navigateToCreateNewProjectPage(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                minimumSize: const Size(150, 50),
              ),
              child: const Text(
                'プロジェクトの新規作成',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 32),
            // "Your Projects"見出し
            const Text(
              'あなたのプロジェクト一覧',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // プロジェクトリスト
            _buildProjectsList(),
          ],
        ),
      ),
    );
  }

  // プロジェクトリストを構築するプライベートメソッド
  Widget _buildProjectsList() {
    // ダミーデータ
    final projects = [
      {
        'updatedTime': 'Last updated 2d ago',
        'title': '急勾配で牛乳を運ぶ方法',
        'details': '12 commits, 3 branches',
        'imageUrl': 'https://placehold.co/100x100/A0E6FF/000000?text=Image',
      },
      {
        'updatedTime': 'Last updated 1w ago',
        'title': 'メガネのレンズがない件について',
        'details': '25 commits, 5 branches',
        'imageUrl': 'https://placehold.co/100x100/FFE0A0/000000?text=Image',
      },
      {
        'updatedTime': 'Last updated 3w ago',
        'title': 'かぼちゃの可能性',
        'details': '8 commits, 2 branches',
        'imageUrl': 'https://placehold.co/100x100/B0FFB0/000000?text=Image',
      },
    ];

    return ListView.builder(
      shrinkWrap: true, // コンテンツに合わせて高さを調整
      physics: const NeverScrollableScrollPhysics(), // 親のスクロールを優先
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return _ProjectCard(
          updatedTime: project['updatedTime']!,
          title: project['title']!,
          details: project['details']!,
          imageUrl: project['imageUrl']!,
          onTap: () {
            // プロジェクトカードがタップされたときのロジック
            // ここにプロジェクト詳細画面などへの遷移ロジックを追加
            // 例: Navigator.push(context, MaterialPageRoute(builder: (context) => ProjectDetailScreen()));
            NavigationService().navigateToCommitBranchListPage(context);
          },
        );
      },
    );
  }
}

// リストの各項目を構築するウィジェット（プロジェクトカード）
class _ProjectCard extends StatelessWidget {
  final String updatedTime;
  final String title;
  final String details;
  final String imageUrl;
  final VoidCallback onTap;

  const _ProjectCard({
    required this.updatedTime,
    required this.title,
    required this.details,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // CardウィジェットをInkWellで囲み、タップ可能にする
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(bottom: 16.0),
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
                      updatedTime,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      details,
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
      ),
    );
  }
}
