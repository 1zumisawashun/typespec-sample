# typespec-sample

## Overview

このリポジトリは以下のユースケースを想定しています：

- TypeSpec → OAS の変換結果の検証
- orval を用いた型安全なクライアント生成の確認
- API モックと実際の挙動が一致しているかのテスト（MSW + Vitest）

## Installation

- clone

```bash
$ gh repo clone 1zumisawashun/typespec-sample
$ cd typespec-sample
$ code .
```

- install

```bash
$ npm install
```

- テストを実行し動作確認をする

```bash
$ npm run test
```

- 上記の手順で失敗する場合 [Troubleshoot](#Troubleshoot)を確認してください

## Troubleshoot

- null

## その他ドキュメント

See [Configuration Reference](https://typespec.io/).
