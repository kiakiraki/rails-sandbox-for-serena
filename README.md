# Ruby LSP Sandbox

Ruby LSPの動作確認用テンプレートプロジェクトです。このプロジェクトは、Ruby言語サーバー（ruby-lsp）の機能をテストするための包括的なRuby/Ruby on Railsのサンプルコードを提供します。

## 📁 プロジェクト構造

```
ruby-lsp-sandbox/
├── app/
│   ├── controllers/           # Rails風のコントローラー
│   │   ├── api/v1/           # API用コントローラー
│   │   ├── application_controller.rb
│   │   ├── users_controller.rb
│   │   └── posts_controller.rb
│   ├── models/               # ActiveRecord風のモデル
│   │   ├── application_record.rb
│   │   ├── user.rb
│   │   ├── post.rb
│   │   └── comment.rb
│   ├── helpers/              # ヘルパーメソッド
│   │   ├── application_helper.rb
│   │   └── users_helper.rb
│   └── services/             # サービスクラス
│       └── user_service.rb
├── config/                   # 設定ファイル
│   ├── application.rb
│   ├── boot.rb
│   ├── routes.rb
│   ├── database.yml
│   └── initializers/
├── lib/                      # ライブラリコード
│   ├── ruby_lsp_sandbox.rb
│   └── tasks/
│       └── demo.rake
├── spec/                     # RSpecテスト
│   ├── models/
│   ├── controllers/
│   ├── factories/
│   ├── spec_helper.rb
│   └── rails_helper.rb
├── Gemfile                   # gem依存関係
└── README.md
```

## 🚀 使用方法

### 1. 依存関係のインストール

```bash
bundle install
```

### 2. Ruby LSPの起動

VSCodeでこのディレクトリを開くか、お使いのエディタでRuby LSPを有効にしてください。

### 3. 動作確認のテスト項目

#### ✅ 基本的な言語機能
- **Syntax highlighting**: ファイル内でRubyコードが正しくハイライトされる
- **Go to definition**: メソッドやクラスの定義にジャンプできる
- **Find references**: メソッドやクラスの使用箇所を検索できる
- **Hover information**: マウスオーバーでメソッドの情報が表示される

#### ✅ インテリセンス機能
- **Auto completion**: メソッドや変数の自動補完
- **Method signatures**: メソッドの引数情報表示
- **Type inference**: 変数や戻り値の型推論

#### ✅ コード分析
- **Diagnostics**: 構文エラーやワーニングの表示
- **Code formatting**: 自動フォーマット
- **Linting**: コード品質チェック

#### ✅ リファクタリング
- **Rename symbol**: 変数やメソッド名の一括変更
- **Extract method**: メソッドの抽出
- **Organize imports**: require文の整理

## 📋 サンプルコードの特徴

### モデル（Models）
- **User**: バリデーション、アソシエーション、スコープ、インスタンスメソッド
- **Post**: 列挙型（enum）、バリデーション、複雑なメソッド
- **Comment**: 権限チェック、ステータス管理

### コントローラー（Controllers）
- **RESTful設計**: 標準的なCRUD操作
- **API endpoints**: JSON形式でのレスポンス
- **認証・認可**: ユーザー権限チェック
- **ページネーション**: Kaminariを使用

### ヘルパー（Helpers）
- **View helpers**: 日付フォーマット、バッジ表示など
- **Application helpers**: 共通的なユーティリティメソッド

### サービス（Services）
- **ビジネスロジック**: 複雑な処理をサービスクラスに分離
- **トランザクション**: データベーストランザクション管理

### テスト（Tests）
- **RSpec**: BDD形式のテスト
- **FactoryBot**: テストデータファクトリー
- **Shoulda matchers**: Rails用のマッチャー

## 🧪 テスト実行

```bash
# 全テスト実行
bundle exec rspec

# 特定のファイルのテスト
bundle exec rspec spec/models/user_spec.rb

# カバレッジ付きでテスト実行
bundle exec rspec --format documentation
```

## 🛠️ 開発用タスク

```bash
# サンプルデータ作成
bundle exec rake demo:create_sample_data

# データベース統計表示
bundle exec rake demo:stats

# サンプルデータ削除
bundle exec rake demo:clean_sample_data
```

## 📚 学習リソース

このプロジェクトでは以下のRuby/Railsの概念を学習できます：

- **ActiveRecord**: モデル、アソシエーション、バリデーション、スコープ
- **ActionController**: RESTful設計、フィルター、パラメータ処理
- **Routing**: ネームスペース、ネストしたリソース
- **Service Objects**: ビジネスロジックの分離
- **Testing**: RSpec、FactoryBot、モック、スタブ
- **API Design**: JSON API、バージョニング、エラーハンドリング

## 🎯 Ruby LSP 動作確認チェックリスト

### 基本機能
- [ ] ファイル内検索（Cmd/Ctrl + F）
- [ ] シンボル検索（Cmd/Ctrl + Shift + O）
- [ ] プロジェクト全体検索（Cmd/Ctrl + Shift + F）
- [ ] 定義へのジャンプ（F12 または Cmd/Ctrl + Click）
- [ ] 参照の検索（Shift + F12）
- [ ] シンボルのリネーム（F2）

### IntelliSense
- [ ] メソッド名の自動補完
- [ ] 変数名の自動補完
- [ ] パラメータヒント
- [ ] ホバー情報

### 診断機能
- [ ] 構文エラーの検出
- [ ] 未定義変数の警告
- [ ] 使用されていない変数の警告

## 📝 ライセンス

このプロジェクトはMITライセンスの下で公開されています。学習・テスト目的での使用を想定しています。

## 🤝 コントリビューション

バグ報告や機能改善の提案は、GitHubのIssueまでお気軽にお寄せください。