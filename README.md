# LAMPエンジニアのためのローカル開発環境構築ひな形

## 構築手順（簡易版）

- 必要なツールのダウンロード & インストール
	- VirtualBoxのインストール
	- Vagrantのインストール
	- vagrant-hostsupdaterのインストール
- hostsファイルに書き込み権限をつける
- gitからこのリポジトリをcloneしてくる
- gitに登録したssh鍵を `ssh/` の下に設置する
- プロジェクトのルートで`vagrant up` コマンドを実行
- `ssh vagrant@htanaka0828.devbase.test` でログイン
- `cd /vagrant/bin && ./all.sh` でdocker起動
- ブラウザで http://sample.htanaka0828.devbase.test にアクセス
- 表示されれば成功

## 必要なもの

### Vagrant

公式サイト
http://www.vagrantup.com/

### VirtualBox

公式サイト
https://www.virtualbox.org/

### plugin

CLIで以下を実行

`vagrant plugin install vagrant-hostsupdater`

hostsに開発domainの情報を書き込んでくれる

hostsへの書き込みを行うのでパーミッションは良い感じに設定を行う

## コマンド関連

### 初回起動

`vagrant up`

これだけ

初回はそこそこ時間がかかるのでネット環境の良いところで実施してください

### シャットダウン

`vagrant halt`

これだけ

### login

以下でssh接続ができる

- host: htanaka0828.devbase.test
- id: vagrant
- pass: vagrant


### docker起動

`cd /vagrant/bin && ./all.sh` でdockerの起動を行う

初回は時間がかかるので、こちらもネット環境の良いところで実行してください

## 設定周り

### docker関連
各インスタンス毎に `htanaka0828/lib/インスタンス名` のあたりに起動scriptとかが入っています

dockerの起動方法などについてはこの辺りを参照してください

### プロジェクトファイル
自動で `/opt/src` 配下に置いています

また、sambaで共有されるので

windowsの場合は `\\htanaka0828.devbase.dev` をエクスプローラで参照

macの場合は `smb://htanaka0828.devbase.dev` をfilnderで参照

をするとローカルからファイルの参照、更新ができます

sambaのログインアカウントもsshと同様に以下になります

- id: vagrant
- pass: vagrant

IDEなどはこの辺りを参照してください

vagrant、dockerにはここのファイルが共有されています
