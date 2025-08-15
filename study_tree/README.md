# StudyTree

**StudyTree** は、暗記ではなく知識の構築プロセスを可視化・操作するブロック型ノートアプリです。  
Gitの「コミット / ブランチ / マージ / フォーク / PR」の概念を学習単位に落とし込み、ナレッジグラフとして自分の学びを“幹・枝・葉”で可視化します。

---

## 🎯 目的

- 学習内容をブロック単位で管理し、編集履歴をコミットとして残す  
- ブランチを作って深掘り・並行学習を可能にする  
- プルリクエストでレビュー・フィードバックを受ける  
- ナレッジグラフで学習内容の関連性を可視化  

---

## 🧑‍💻 ターゲットユーザー

- 個人の学習者  
- 教員 / メンター（公開プロジェクトのオーナー）  
- コラボレーション参加者（PRで貢献可能）  

---

## ⚡ MVP 機能

1. **認証**  
   - Email/Password、Google、Apple（iOS）  
2. **プロジェクト作成**  
   - 自動でメインブランチ・空ノート生成  
3. **ブロック型ノートエディタ**  
   - Markdown対応の見出し・段落・リスト等  
4. **コミット管理**  
   - 差分(diff)を計算して履歴管理  
5. **ブランチ作成・切替**  
   - スナップショットを元に独立した編集ラインを作成  
6. **コミット履歴表示**  
   - タイムラインで変更履歴を確認  

---

## 🌐 技術スタック

- **フロントエンド**: Flutter / Dart  
- **IDE**: VS Code  
- **バックエンド**: Firebase  
  - Authentication (Email, Google, Apple)  
  - Firestore（ドキュメントDB + オフライン対応）  
  - Cloud Storage（添付ファイル）  
  - Cloud Functions（マージ処理・PR検証）  
- **補助プラグイン**:  
  - `flutter_markdown`, `graphview` など  

---

## 🗂 データモデル（Firestore）

- `/users/{userId}`: ユーザー情報  
- `/projects/{projectId}`: プロジェクト情報  
- `/branches/{branchId}`: ブランチ情報  
- `/commits/{commitId}`: コミット履歴  
- `/notes/{noteId}`: ノートスナップショット  
- `/pullRequests/{prId}`: PR情報  
- `/graphNodes/{nodeId}` / `/graphEdges/{edgeId}`: ナレッジグラフ  

---

## ⚙ 実装のポイント

- **オフライン対応**: Firestore永続化  
- **差分管理**: ブロック単位でコミット差分を生成  
- **マージ戦略**: 3-wayマージをブロック単位で実施  
- **セキュリティ**: Auth + Firestore/Storageルール + App Check  
- **添付管理**: Storageに画像・PDF・音声を保存  

---

## 🚀 ローカル開発

1. Flutter / VS Code / Dart をインストール  
2. Firebase CLI & FlutterFire CLI 設定  
   ```bash
   npm i -g firebase-tools
   firebase login
   dart pub global activate flutterfire_cli
   flutterfire configure
