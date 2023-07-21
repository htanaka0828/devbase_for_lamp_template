# PHPエンジニアのためのローカル開発環境構築ひな形

## 構築手順（簡易版）

- 必要なツールのダウンロード & インストール
	- VirtualBoxのインストール
	- Vagrantのインストール
- gitからこのリポジトリをcloneしてくる
- プロジェクトのルートで`vagrant up` コマンドを実行
- hostsファイルに `192.168.33.110 devbase.me` を追加
- `ssh vagrant@devbase.me` でログイン
- `cd /vagrant/bin && ./all.sh` でdocker起動
- ブラウザで http://devbase.me にアクセス
- 表示されれば成功

## 必要なもの

### Vagrant

公式サイト
http://www.vagrantup.com/

### VirtualBox

公式サイト
https://www.virtualbox.org/

### hostの書き換え
hostsに以下を追加する

```
192.168.33.110 devbase.me
```

※　以前はプラグインで解決していたけどいまいち不安定なので手動にしました

## コマンド関連

### 初回起動

`vagrant up`

これだけ

初回はそこそこ時間がかかるのでネット環境の良いところで実施してください

### シャットダウン

`vagrant halt`

これだけ

### SSH login

以下でssh接続ができる

- host: devbase.me
- id: vagrant
- pass: vagrant


### docker起動

`cd /vagrant/bin && ./all.sh` でdockerの起動を行う

初回は時間がかかるので、こちらもネット環境の良いところで実行してください

## 設定周り

### docker関連
各インスタンス毎に `vagrant/lib/インスタンス名` のあたりに起動scriptとかが入っています

dockerの起動方法などについてはこの辺りを参照してください

### プロジェクトファイル
自動で `/opt/src` 配下に置いています

また、sambaで共有されるので

windowsの場合は `\\devbase.me` をエクスプローラで参照

macの場合は `smb://devbase.me` をfinderで参照

をするとローカルからファイルの参照、更新ができます

sambaのログインアカウントもsshと同様に以下になります

- id: vagrant
- pass: vagrant

IDEなどはこの辺りを参照してください

vagrant、dockerにはここのファイルが共有されています
