# nft-sahokun-eth

<!-- このファイルは AI エージェント（Claude Code・Codex など）と人の両方に向けた、このリポジトリの作業規則。
     「プロジェクト固有」の節はプロジェクトごとに書き換え、「共通の規則」の節は sahokun の全リポジトリで共通に保つ。 -->

## プロジェクト固有

### 概要

ERC721 の NFT コントラクト。メタデータは GitHub Pages（`gh-pages` ブランチの `/docs`）で配信する（https://sahokun.github.io/nft-sahokun-eth/metadata/0 など）。

### 技術スタックと構成

- Solidity（`^0.8.4`）。コントラクトは `contracts/sahoe.sol` で、OpenZeppelin の ERC721 の拡張（Enumerable・URIStorage・Pausable・Ownable・Burnable）を使う。
- 開発は Remix IDE で行い、`@remix-project/remixd` でローカルの `contracts/` を共有する。
- パッケージの管理は yarn（`yarn.lock`）。

### 確認の手順

```bash
yarn install
yarn remixd    # remixd -s ./contracts --remix-ide https://remix.ethereum.org
```

- https://remix.ethereum.org で workspace-localhost に接続し、コンパイルとデプロイ（テストネット）で確かめる。自動のテストは無い。

## 共通の規則

### ブランチと PR

<!-- branch-model:begin -->
- 既定のブランチは `main`。作業はブランチを切り、`main` への PR にする。
- PR は squash merge で取り込む。main の履歴には PR のタイトルだけが 1 コミットとして残る。
<!-- branch-model:end -->
- PR のタイトルは Conventional Commits（`feat: ...`・`fix: ...` など）で、変更の内容が 1 行で分かるように書く。
- PR がマージされたら、作業ブランチは自動で削除される。

### 履歴と公開物に書かないもの

- メールアドレス・トークン・パスワード・個人の環境の情報・AI エージェントのセッションへのリンクを、コミット・PR・Issue・コメントに書かない。
  - 作業ブランチのコミットと PR は、マージ後も GitHub に残り続け、所有者でも消せない。main の履歴も書き換えには強制 push とサポートへの依頼が要る。PR の本文だけは後から編集で直せる。
- コミットの作成者のメールアドレスは、GitHub の noreply アドレス（`<ID>+<ユーザー名>@users.noreply.github.com`）を使う。
- `.env`・鍵ファイル・ローカル設定（`.claude/settings.local.json` など）はコミットしない。

### 依存関係

- 追加・更新する依存は、公開から 7 日以上たったバージョンに限る。公開直後に乗っ取り・差し替えが見つかる事例が多いため。
  - Dependabot のバージョン更新は `cooldown` で 7 日待つ。npm は `.npmrc` の `min-release-age=7` で手作業の更新にも同じ制限を掛ける。
- GitHub Actions のアクションは、フル SHA（40 桁）で固定し、行末にバージョンをコメントで残す（例: `actions/checkout@<SHA> # v7.0.1`）。タグは差し替えられるため。
- Dependabot の PR は、更新を知らせる合図として扱う。CI が通ることと、メジャー更新では変更点を確かめてから取り込む。
