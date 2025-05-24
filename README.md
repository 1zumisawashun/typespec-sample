# typespec-sample

## Overview

このリポジトリは以下のユースケースを想定しています：

- TypeSpec → OpenAPI仕様 (OAS) への変換結果の検証
- Orvalを用いた型安全なAPIクライアント生成の確認
- API モックと実際の挙動が一致しているかのテスト（MSW + Vitest）

## プロジェクト構成

```
typespec-sample/
├── dist/                    # TypeSpecからコンパイルされたOpenAPI仕様
│   └── schema/              # YAML形式のOpenAPI仕様ファイル
├── src/
│   ├── features/            # 機能ごとのディレクトリ
│   │   ├── petstore/        # ペットストアAPI定義のサンプル
│   │   │   ├── endpoints/   # Orvalで生成されたAPIクライアント
│   │   │   ├── models/      # Orvalで生成されたデータモデル
│   │   │   ├── petstore.test.ts # テストファイル
│   │   │   └── petstore.tsp # TypeSpec API定義
│   │   └── widgets/         # ウィジェットAPI定義のサンプル
│   │       └── widgets.tsp  # TypeSpec API定義
│   └── functions/           # 汎用機能
│       ├── custom-fetch.ts  # カスタムフェッチ関数
│       ├── main.tsp         # TypeSpecエントリーポイント
│       └── msw.ts           # MSWセットアップ
├── orval.config.ts          # Orval設定ファイル
├── package.json             # プロジェクト依存関係
├── tsconfig.json            # TypeScript設定
├── tspconfig.yaml           # TypeSpec設定
└── vitest.config.ts         # Vitestテスト設定
```

## ワークフロー

このプロジェクトは以下のワークフローで構築されています：

1. **TypeSpec定義の作成**: APIを`.tsp`ファイルで定義
2. **OpenAPI仕様への変換**: `npm run build:tsp`でOpenAPI仕様を生成
3. **APIクライアントの生成**: `npm run codegen`でOrvalを使用してTypeScriptクライアントを生成
4. **モックサーバーの利用**: MSWを使用して生成されたAPIクライアントをモック
5. **テスト実行**: `npm run test`でVitest経由でテストを実行

## Installation

- リポジトリのクローン

```bash
$ gh repo clone 1zumisawashun/typespec-sample
$ cd typespec-sample
$ code .
```

- 依存関係のインストール

```bash
$ npm install
```

- TypeSpecからOpenAPI仕様を生成

```bash
$ npm run build:tsp
```

- APIクライアントの生成

```bash
$ npm run codegen
```

- テストを実行し動作確認をする

```bash
$ npm run test
```

上記の手順で失敗する場合は [Troubleshoot](#troubleshoot)を確認してください。

## Troubleshoot

- **TypeSpec関連エラー**
  - エラーメッセージ: `tsp: command not found`
  - 解決方法: `npm install -g @typespec/compiler`でTypeSpecをグローバルにインストール

- **Orval生成エラー**
  - エラーメッセージ: `biome not found`
  - 解決方法: `npm install -g @biomejs/biome`でBiomeをインストール、または`orval.config.ts`の`biome: true`を`false`に変更

- **MSWテストエラー**
  - エラーメッセージ: `Error: [MSW] request.passthrough() cannot be used during tests`
  - 解決方法: テストファイルで`server.use()`を使用して適切なモックハンドラーを提供していることを確認

## 主要技術

- **[TypeSpec](https://typespec.io/)**: APIの定義を作成するためのマイクロソフト製言語
- **[Orval](https://orval.dev/)**: OpenAPI仕様からTypeScriptクライアントを生成するツール
- **[MSW](https://mswjs.io/)**: APIモッキングのためのライブラリ
- **[Vitest](https://vitest.dev/)**: React向けのテストフレームワーク

## その他ドキュメント

- [TypeSpec ドキュメント](https://typespec.io/docs/introduction)
- [Orval ドキュメント](https://orval.dev/reference/configuration)
- [MSW ドキュメント](https://mswjs.io/docs/)
- [Vitest ドキュメント](https://vitest.dev/guide/)
